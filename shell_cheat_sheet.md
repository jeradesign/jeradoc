# Shell Cheat Sheet

## See what dotfiles have accumulated in your home directory

```bash
ls -altd .*
```

## Clean up old homebrew installs

```bash
brew list --installed-on-request
brew info [FORMULA|CASK...]
brew uninstall FORMULA|CASK...
```
