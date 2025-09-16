if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set Path
set -Ux PATH $HOME/.local/bin $PATH

# Aliases

alias ls='eza -al --color=always --group-directories-first --icons'
alias cat='batcat --paging=never'
alias find='fdfind'
alias grep='rg'
alias lg='lazygit'
alias ..='cd ..'
alias apt=nala
alias diff='diff --color=auto'
alias hack='cd /home/kali/offsec && sudo openvpn universal.ovpn'
alias install='sudo nala install'
alias ip='ip --color=auto'
alias listen='nc -nvlp 4242'
alias server='python3 -m http.server 80'
alias sudo='sudo '
alias update='sudo nala update'
alias upgrade='sudo nala full-upgrade'
alias vim=nvim

# fzf Integration
set -gx FZF_DEFAULT_COMMAND 'fdfind --type f'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'

starship init fish | source
