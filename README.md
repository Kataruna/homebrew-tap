# Kataruna's Homebrew tap

Apps by [Kataruna](https://github.com/Kataruna), installed with [Homebrew](https://brew.sh).

```sh
brew install --cask kataruna/tap/<app>
```

| App | Install | |
|---|---|---|
| [Lemon](https://github.com/Kataruna/Lemon) | `brew install --cask kataruna/tap/lemon` | Drag-and-drop file converter with a wheel of formats (Apple silicon, macOS 14+) |

Update with `brew upgrade --cask <app>`, remove with `brew uninstall --cask <app>` (add `--zap` to also remove its settings).

## Adding a new release

Update `version` and `sha256` in `Casks/<app>.rb` (`shasum -a 256 <file>` gives the hash), then check it:

```sh
brew style --fix Casks/<app>.rb
brew audit --cask --strict kataruna/tap/<app>
```
