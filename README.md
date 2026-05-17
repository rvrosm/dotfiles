# dotfiles

Personal dotfiles managed with a bare Git repository.

This repository provides:


- system bootstrap (one command setup)
- package installation (Arch / Ubuntu / macOS)
- shell + editor configuration
- alacritty config build system
- zsh completions generator

---

## Installation

### One-command bootstrap

```bash
bash <(curl -s https://raw.githubusercontent.com/rvrosm/dotfiles/master/.config/bootstrap.sh)
```

## Git Remote (Optional)

By default, the repository is cloned using HTTPS.

If you want to push changes without entering credentials, switch to SSH:

```bash
dotfiles remote set-url origin git@github.com:rvrosm/dotfiles.git
```

## Links

* [How to store dotfiles | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)


