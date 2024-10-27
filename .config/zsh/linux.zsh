# Aliases {{{

alias sl=systemctl 
alias slb='systemctl start'
alias slk='systemctl stop'
alias sle='systemctl enable'
alias sld='systemctl disable'
alias slr='systemctl restart'
alias sls='systemctl status'
alias sldr='systemctl daemon-reload'

alias jl=journalctl 
alias jlxe='journalctl -xe'

alias rl=resolvectl

alias yp=yabsnap
alias bk=btrbk

alias pacu='pacman -Syu'
alias pacs='pacman -Ss'
alias paci='pacman -S'
alias pacr='pacman -R'
alias pacq='pacman -Q'
alias pacc='pacman -Syc'

alias nlr='nft list ruleset'
alias nff='nft -f /etc/nftables.conf'
# Aliases }}}
