# MoneyPrinterTurbo (fork)

Fork of [harry0703/MoneyPrinterTurbo](https://github.com/harry0703/MoneyPrinterTurbo): generates short videos from a topic (LLM script, stock footage from Pexels/Pixabay, TTS, subtitles). Registered in Skunkworks as `moneyprinterturbo`.

## Remotes
- `origin`: aliumar521/MoneyPrinterTurbo (public, because GitHub forks of public repos can't be made private)
- `upstream`: harry0703/MoneyPrinterTurbo. Sync with `git fetch upstream && git merge upstream/main`. Keep our changes in files of our own (`docker-compose.oracle.yml`, this file) so merges stay clean. `Dockerfile.oracle` exists because upstream's `Dockerfile` uses a bullseye base that no longer builds on arm64. If upstream picks up a dependency that needs a system package, mirror the change there.

## Deployment
- Server: oracle-hash (129.146.84.6), `~/moneyprinterturbo`, compose project `moneyprinterturbo`, built from `docker-compose.oracle.yml`.
- URL: https://mpt.129-146-84-6.sslip.io, behind Traefik basic auth (user `ali`). The password is in `~/moneyprinterturbo/.basic-auth-password` on the server.
- Routing: `/data/coolify/proxy/dynamic/moneyprinterturbo.yml`, hand-written and not managed by Coolify.
- Update: `cd ~/moneyprinterturbo && git pull && docker compose -f docker-compose.oracle.yml up -d --build`
- `config.toml` (API keys) and `storage/` (generated videos) live only on the server and are gitignored. Never commit them.
