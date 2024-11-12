# Dotfiles

This repository contains my personal dotfiles managed with GNU Stow and Ansible.

## Prerequisites

The dotfiles can be installed either through the install script or Ansible. Choose the method that works best for you.

### Ansible Installation
- Python 3.x
- Ansible (install with `pip install ansible`)

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

You can choose between two installation methods:

### Method 1: Using Ansible (Recommended)

1. Clone this repository:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Install Ansible if not already installed:
```bash
pip install ansible
```

3. Run the Ansible playbook:
```bash
ansible-playbook playbook.yml
```

### Method 2: Using Install Script

1. Clone this repository:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
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
