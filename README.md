# Dotfiles

This repository contains my personal dotfiles managed with GNU Stow.

## Prerequisites

The install script will automatically install these dependencies based on your distribution:

### Core Dependencies
- GNU Stow
- Git
- Neovim
- Tmux
- Zsh
- Wezterm

### Hyprland Dependencies (Fedora/Arch)
- Hyprland
- Waybar
- Wofi
- Dunst
- PlayerCTL
- Pamixer
- BrightnessCtL
- Network Manager Applet
- Polkit Gnome
- XDG Desktop Portal Hyprland

Note: Some dependencies might not be available in the default repositories for Ubuntu/Debian. The script will install what's available and notify you of any missing packages.

## Installation

1. Clone this repository:
```bash
git clone https://github.com/pedersandvoll/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Run the install script:
```bash
./install.sh
```

## What's Included

- Hyprland configuration (`hypr/`)
- Neovim configuration (`nvim/`)
- Tmux configuration (`tmux/`)
- Wezterm configuration (`wezterm/`)
- Zsh configuration (`zsh/`)

## Manual Installation

If you prefer to install specific configurations, you can use stow directly:

```bash
stow hypr    # Install Hyprland config
stow nvim    # Install Neovim config
stow tmux    # Install Tmux config
stow wezterm # Install Wezterm config
stow zsh     # Install Zsh config
```

## Uninstalling

To remove any stowed configuration:

```bash
stow -D <package-name>
```

For example: `stow -D nvim` will remove the Neovim configuration.
