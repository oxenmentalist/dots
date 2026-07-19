# dots

Personal macOS configuration managed with Homebrew, Git, and GNU Stow.

## Prerequisites

This repository is macOS-first. Install the Homebrew package manager if it is
not already available:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

The initial clone requires Git. macOS will offer to install its Command Line
Tools when `git` is first run:

```bash
git clone git@om:oxenmentalist/dots.git ~/src/om/dots
cd ~/src/om/dots
```

The SSH host alias `om` must already exist in `~/.ssh/config`. Alternatively,
clone using the full GitHub host and change the remote after configuring the
account:

```bash
git clone git@github.com:oxenmentalist/dots.git ~/src/om/dots
cd ~/src/om/dots
```

## Install Software

Install the command-line tools (including the Starship prompt), Ghostty, and
Maple Mono Nerd Font declared in the repository's `Brewfile`:

```bash
brew bundle install
```

Check whether all declared dependencies are installed without changing the
machine:

```bash
brew bundle check
```

After installation, run the repository doctor to check dependencies, private
Git identities, the configured font, Stow conflicts, Neovim health, and shell
configuration syntax:

```bash
scripts/doctor
```

The Brewfile is intentionally limited to software required by these dotfiles;
it is not a snapshot of every Homebrew package installed on the machine.

## Repository Layout

```
dots/
├── Brewfile
├── git/
│   └── .gitconfig
├── ghostty/
│   └── .config/ghostty/
├── nvim/
│   └── .config/nvim/
├── scripts/
│   └── doctor
├── tmux/
│   └── .tmux.conf
└── zsh/
    └── .zshrc
```

Each top-level directory is a **Stow package**.

## Install Configuration

After installing the software, create the configuration symlinks from the
repository root:

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

Update Homebrew dependencies and reinstall the Stow packages as needed:

```bash
brew bundle install
stow -R git tmux zsh ghostty nvim
```

Edit tracked configuration in this repository, then commit and push as usual.

## Removing Symlinks

```bash
stow -D git tmux zsh ghostty nvim
```

## GitHub Accounts

This repository uses the **oxenmentalist** GitHub account.

The shared Git configuration selects between two private identity files:

- `~/.gitconfig-nl` is the default identity for repositories under `~/`.
- `~/.gitconfig-om` overrides it for repositories under `~/src/om/`.

Create these files directly in the home directory. They are intentionally not
Stow packages and must not be checked into this public repository. Each file
contains only its identity:

```gitconfig
[user]
	name = Your Name
	email = your-address@example.com
```

Shared behavior, including `init.defaultBranch = main`, belongs in the tracked
`git/.gitconfig` rather than in either private identity file.

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

- macOS is the supported bootstrap path. Most command-line configuration may
  also work on Linux, but Linux package installation and behavior are not
  maintained here.
- The repository is the source of truth.
- Never edit the symlink targets in `$HOME`; edit the files in this repository instead.
- Prefer `git push --force-with-lease` over `git push --force` when rewriting history.
