source ~/.zsh_secrets

[ -n "$WEZTERM_PANE" ] && export NVIM_LISTEN_ADDRESS="/tmp/nvim$WEZTERM_PANE"
# if [ "$TMUX" = "" ]; then tmux attach; fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# SharePoint
# export SPFX_SERVE_TENANT_DOMAIN=netpoweras.sharepoint.com
export SPFX_SERVE_TENANT_DOMAIN=testnetpower.sharepoint.com

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="3den"
# ZSH_THEME="gruvbox"
# SOLARIZED_THEME="dark"
# ZSH_THEME="arrow"
ZSH_THEME="powerlevel10k/powerlevel10k"

source ~/.zsh/zsh-magic-dashboard/magic_dashboard.zsh

plugins=( 
    git
    dnf
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ----- Bat (better cat) -----
export BAT_THEME=gruvbox-dark

alias cat="bat"

# ---- Eza (better ls) -----
alias ls="eza --color=always --no-filesize --icons=always --no-time --no-user --no-permissions"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"

# Alias fzf
# Enhanced nfzf alias for directory search
alias pfzf="~/scripts/tmux-sessionizer"
alias scd='cd $(fzf --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv | fzf)'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:/home/pedersandvoll/.spicetify

export PATH=$PATH:/usr/local/bin/nvim

# golang
export PATH=$PATH:/usr/local/go/bin

# lua
export PATH=$PATH:/usr/local/share/lua

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
