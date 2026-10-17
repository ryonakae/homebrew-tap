# ryonakae/homebrew-tap

Homebrew tap for my macOS applications.

## Casks

| Cask | Description |
|---|---|
| [`sheltie`](Casks/sheltie.rb) | Arrange live web pages on an infinite canvas and review them like artboards |
| [`strata-menubar`](Casks/strata-menubar.rb) | Menu bar app to start, stop and configure a local Strata LLM server |

## Install

```bash
brew install --cask ryonakae/tap/sheltie
brew install --cask ryonakae/tap/strata-menubar
```

Or tap first and install by name:

```bash
brew tap ryonakae/tap
brew install --cask sheltie
```

## Upgrade

```bash
brew upgrade --cask sheltie
```

## Uninstall

```bash
brew uninstall --cask sheltie
```

To remove application data as well:

```bash
brew uninstall --zap --cask sheltie
```
