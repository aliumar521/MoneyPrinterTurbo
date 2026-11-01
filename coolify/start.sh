#!/usr/bin/env bash
# Container entrypoint for the Coolify build: Streamlit on 127.0.0.1:8502, Caddy's login gate on :8501.
# Refuses to start without credentials, so the WebUI is never exposed unauthenticated.
set -euo pipefail

: "${MPT_AUTH_USER:?set MPT_AUTH_USER in Coolify environment variables}"
: "${MPT_AUTH_PASSWORD:?set MPT_AUTH_PASSWORD in Coolify environment variables}"
MPT_AUTH_HASH=$(caddy hash-password --plaintext "$MPT_AUTH_PASSWORD")
export MPT_AUTH_HASH
unset MPT_AUTH_PASSWORD

streamlit run ./webui/Main.py --server.address=127.0.0.1 --server.port=8502 \
  --browser.gatherUsageStats=False --client.toolbarMode=minimal \
  --logger.hideWelcomeMessage=True --server.showEmailPrompt=False &
caddy run --config /MoneyPrinterTurbo/coolify/Caddyfile --adapter caddyfile &

# If either process exits, stop the container so Coolify/Docker restarts it.
wait -n
exit $?
