# zcompile-many {{{
# function zcompile-many() {
#   local f
#   for f; do zcompile -R -- "$f".zwc "$f"; done
# }
# zcompile-many }}}
# zsh-z {{{
if [[ ! -e ${_zdir}/zsh-z/zsh-z.plugin.zsh ]]; then
    git clone https://github.com/agkozak/zsh-z.git $_zdir/zsh-z
    # zcompile-many ${_zdir}/zsh-z/zsh-z.plugin.zsh
fi
# zsh-z }}}
# fast-syntax-highlighting {{{
if [[ ! -e ${_zdir}/fsh/fast-syntax-highlighting.plugin.zsh ]]; then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ${_zdir}/fsh
    # zcompile-many ${_zdir}/fsh/fast-syntax-highlighting.plugin.zsh
fi

# fast-syntax-highlighting }}}
# zsh-autosuggestions {{{
if [[ ! -e ${_zdir}/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${_zdir}/zsh-autosuggestions
    # zcompile-many ${_zdir}/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
fi

# zsh-autosuggestions }}}
# Load Plugins {{{
# Enable the "new" completion system (compsys).
# [[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
# unfunction zcompile-many

# ZSH_AUTOSUGGEST_MANUAL_REBIND=1
source ${_zdir}/zsh-z/zsh-z.plugin.zsh
source ${_zdir}/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${_zdir}/fsh/fast-syntax-highlighting.plugin.zsh
# Load Plugins }}}
