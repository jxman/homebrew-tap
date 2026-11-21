# jxman/tap

[![Brew Updates](https://img.shields.io/github/v/release/jxman/brew-updates?display_name=release&label=cask)](https://github.com/jxman/brew-updates)

Homebrew tap for [Brew Updates](https://github.com/jxman/brew-updates), a Mac app that keeps Homebrew and everything installed with it updated, backed up and scanned for vulnerabilities on a schedule.

## Install

```bash
brew install --cask jxman/tap/brew-updates
```

Then open **Brew Updates** from Applications and click **Set Up**. See [Getting started](https://github.com/jxman/brew-updates#getting-started).

The app updates itself, so `brew upgrade` skips it (`auto_updates true`). `brew uninstall --cask brew-updates` removes the app and its schedule; add `--zap` to also delete its logs, Brewfile backups and settings.

## Casks

| Cask | App |
| --- | --- |
| `brew-updates` | [Brew Updates](https://github.com/jxman/brew-updates): requires macOS 15+ on Apple silicon |

## Maintaining

Each Brew Updates release updates `version` and `sha256` in `Casks/brew-updates.rb` with `scripts/update-cask.sh` in the brew-updates repo. Check a change with:

```bash
brew style jxman/tap
brew audit --cask --online jxman/tap/brew-updates
```

---

_Maintained by John Xanthopoulos · [MIT License](LICENSE)_
