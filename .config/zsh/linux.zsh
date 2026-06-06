# Path
# Soar 
path=($HOME/.local/share/soar/bin/ $path)

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Aliases {{{

alias S=systemctl 
alias Sb='systemctl start'
alias Sk='systemctl stop'
alias Se='systemctl enable'
alias Sd='systemctl disable'
alias Sr='systemctl restart'
alias Ss='systemctl status'
alias SR='systemctl daemon-reload'

alias J=journalctl 
alias Jxe='journalctl -xe'

alias R=resolvectl

alias yp=yabsnap
alias bk=btrbk

alias P=pacman
alias Pu='pacman -Syu'
alias Ps='pacman -Ss'
alias Pi='pacman -S'
alias Pr='pacman -R'
alias Pq='pacman -Q'
alias Pc='pacman -Syc'

alias Nl='nft list ruleset'
alias Nf='nft flush ruleset'

alias K=kubectl
alias Kn='kubectl get nodes -o wide'
alias Ka='kubectl get pods -A'
# Aliases }}}
