#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Detect the Linux distribution
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    elif [ -f /etc/debian_version ]; then
        echo "debian"
    elif [ -f /etc/fedora-release ]; then
        echo "fedora"
    elif [ -f /etc/arch-release ]; then
        echo "arch"
    else
        echo "unknown"
    fi
}

# Install packages based on the distribution
install_packages() {
    local distro=$(detect_distro)
    echo -e "${BLUE}Detected distribution: $distro${NC}"

    case $distro in
        "fedora")
            echo -e "${YELLOW}Installing dependencies for Fedora...${NC}"
            sudo dnf install -y stow git neovim tmux zsh wezterm hyprland waybar \
                wofi dunst playerctl pamixer brightnessctl network-manager-applet \
                polkit-gnome xdg-desktop-portal-hyprland
            ;;
        "ubuntu"|"debian")
            echo -e "${YELLOW}Installing dependencies for Ubuntu/Debian...${NC}"
            sudo apt update
            sudo apt install -y stow git neovim tmux zsh
            # For Ubuntu, some packages might need additional repos
            if [ "$distro" = "ubuntu" ]; then
                sudo add-apt-repository ppa:neovim-ppa/unstable -y
                sudo apt update
                sudo apt install -y neovim
            fi
            ;;
        "arch")
            echo -e "${YELLOW}Installing dependencies for Arch Linux...${NC}"
            sudo pacman -S --needed stow git neovim tmux zsh wezterm hyprland waybar \
                wofi dunst playerctl pamixer brightnessctl network-manager-applet \
                xdg-desktop-portal-hyprland polkit-gnome
            ;;
        *)
            echo -e "${RED}Unsupported distribution. Please install dependencies manually.${NC}"
            exit 1
            ;;
    esac
}

# Check and install dependencies
echo -e "${BLUE}Checking and installing prerequisites...${NC}"
install_packages

# Array of directories to stow
STOW_DIRS=(
    "hypr"
    "nvim"
    "tmux"
    "wezterm"
    "zsh"
)

# Create backups of existing configs
echo -e "${BLUE}Creating backups of existing configs...${NC}"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

for dir in "${STOW_DIRS[@]}"; do
    # Check if there are any files to backup
    if [ -d "$HOME/.config/$dir" ] || [ -f "$HOME/.${dir}rc" ]; then
        echo "Backing up existing $dir configuration..."
        if [ -d "$HOME/.config/$dir" ]; then
            cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
        fi
        if [ -f "$HOME/.${dir}rc" ]; then
            cp "$HOME/.${dir}rc" "$BACKUP_DIR/"
        fi
    fi
done

# Stow each directory
echo -e "${BLUE}Installing dotfiles...${NC}"
for dir in "${STOW_DIRS[@]}"; do
    echo "Stowing $dir..."
    stow -R "$dir" 2>/dev/null || {
        echo -e "${RED}Failed to stow $dir${NC}"
        continue
    }
    echo -e "${GREEN}Successfully stowed $dir${NC}"
done

echo -e "${GREEN}Installation complete!${NC}"
echo "Backup of old configs can be found in: $BACKUP_DIR"
