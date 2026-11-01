# MoneyPrinterTurbo (fork)

Fork of [harry0703/MoneyPrinterTurbo](https://github.com/harry0703/MoneyPrinterTurbo): makes short videos from a topic (an LLM script, stock footage from Pexels/Pixabay, TTS and subtitles). Registered in Skunkworks as `moneyprinterturbo`.

## Remotes
- `origin`: aliumar521/MoneyPrinterTurbo. It's public because GitHub forks of public repos can't be private.
- `upstream`: harry0703/MoneyPrinterTurbo. Sync with `git fetch upstream && git merge upstream/main`. Keep our changes in files of our own (`Dockerfile.coolify`, this file) so merges stay clean.

## Deployment (Coolify-managed)
- Coolify on oracle-hash (https://coolifyhash.flyk.pro): project **MoneyPrinterTurbo**, app `moneyprinterturbo`, Dockerfile build pack using `/Dockerfile.coolify`, branch `main`, port 8501.
- URL: https://mpt.flyk.pro. Coolify's HTTP basic auth (user `ali`) protects it, because the WebUI has no login of its own and holds the API keys. The password is in the app's settings in Coolify and in `~/.mpt-basic-auth-password` on the server.
- Persistent volume `mpt-data` is mounted at `/data` (`MPT_HOME`). It holds `config.toml` (API keys, saved from the WebUI), `storage/` and `resource/`. Never commit `config.toml`.
- Auto-deploy is off. To ship, push to `main`, then press **Deploy** in Coolify.
- `Dockerfile.coolify` exists because upstream's `Dockerfile` uses a bullseye base that no longer builds on arm64. If upstream adds a dependency that needs a system package, add it there as well.
