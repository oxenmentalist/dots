# dots

Personal macOS/Linux configuration managed with Git and GNU Stow.

## Prerequisites

Install Stow:

```bash
brew install stow
```

Clone the repository:

```bash
git clone git@om:oxenmentalist/dots.git ~/src/om/dots
cd ~/src/om/dots
```

## Repository Layout

```
dots/
├── git/
│   └── .gitconfig
├── ghostty/
│   └── .config/ghostty/
├── nvim/
│   └── .config/nvim/
├── tmux/
│   └── .tmux.conf
└── zsh/
    └── .zshrc
```

Each top-level directory is a **Stow package**.

## Install Configuration

From the repository root:

```bash
stow git tmux zsh ghostty nvim
```

This creates symlinks in `$HOME`, for example:

```
~/.gitconfig      -> dots/git/.gitconfig
~/.tmux.conf      -> dots/tmux/.tmux.conf
~/.zshrc          -> dots/zsh/.zshrc
~/.config/nvim    -> dots/nvim/.config/nvim
~/.config/ghostty -> dots/ghostty/.config/ghostty
```

## Updating

Edit the files in this repository, then commit and push as usual.

If package layouts change:

```bash
stow -R git tmux zsh ghostty nvim
```

## Removing Symlinks

```bash
stow -D git tmux zsh ghostty nvim
```

## GitHub Accounts

This repository uses the **oxenmentalist** GitHub account.

Verify the remote:

```bash
git remote -v
```

Expected:

```text
origin  git@om:oxenmentalist/dots.git
```

If needed:

```bash
git remote set-url origin git@om:oxenmentalist/dots.git
```

## Helpful Commands

Show where Git configuration comes from:

```bash
git config --list --show-origin
```

Show current Git identity:

```bash
git config user.name
git config user.email
```

Preview what Stow will do:

```bash
stow -nv git
```

Restow a package:

```bash
stow -R git
```

## Notes

- The repository is the source of truth.
- Never edit the symlink targets in `$HOME`; edit the files in this repository instead.
- Prefer `git push --force-with-lease` over `git push --force` when rewriting history.
