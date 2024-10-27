# zcompile-many {{{
# function zcompile-many() {
#   local f
#   for f; do zcompile -R -- "$f".zwc "$f"; done
# }
# zcompile-many }}}
# zsh-z {{{
if [[ ! -e ${_zplugs}/zsh-z/zsh-z.plugin.zsh ]]; then
    git clone https://github.com/agkozak/zsh-z.git $_zplugs/zsh-z
    # zcompile-many ${_zplugs}/zsh-z/zsh-z.plugin.zsh
fi
# zsh-z }}}
# fast-syntax-highlighting {{{
if [[ ! -e ${_zplugs}/fsh/fast-syntax-highlighting.plugin.zsh ]]; then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ${_zplugs}/fsh
    # zcompile-many ${_zplugs}/fsh/fast-syntax-highlighting.plugin.zsh
fi

# fast-syntax-highlighting }}}
# zsh-autosuggestions {{{
if [[ ! -e ${_zplugs}/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${_zplugs}/zsh-autosuggestions
    # zcompile-many ${_zplugs}/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
fi

# zsh-autosuggestions }}}
# Load Plugins {{{
# Enable the "new" completion system (compsys).
# [[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
# unfunction zcompile-many

# ZSH_AUTOSUGGEST_MANUAL_REBIND=1
source ${_zplugs}/zsh-z/zsh-z.plugin.zsh
source ${_zplugs}/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${_zplugs}/fsh/fast-syntax-highlighting.plugin.zsh
# Load Plugins }}}
