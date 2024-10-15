# zsh-z {{{
if [[ ! -e ${ZPLUGINS}/zsh-z/zsh-z.plugin.zsh ]]; then
    git clone https://github.com/agkozak/zsh-z.git $ZPLUGINS/zsh-z
fi
source ${ZPLUGINS}/zsh-z/zsh-z.plugin.zsh
# zsh-z }}}
# fast-syntax-highlighting {{{
if [[ ! -e ${ZPLUGINS}/fsh/fast-syntax-highlighting.plugin.zsh ]]; then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ${ZPLUGINS}/fsh
fi

source ${ZPLUGINS}/fsh/fast-syntax-highlighting.plugin.zsh
# fast-syntax-highlighting }}}
# zsh-autosuggestions {{{
if [[ ! -e ${ZPLUGINS}/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZPLUGINS}/zsh-autosuggestions
fi

source ${ZPLUGINS}/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-autosuggestions }}}
# pure {{{
# if [[ ! -e ${ZPLUGINS}/pure ]]; then
#     git clone https://github.com/sindresorhus/pure.git ${ZPLUGINS}/pure
# fi

# fpath+=(${ZPLUGINS}/pure)
# autoload -U promptinit; promptinit
# prompt pure
# pure }}}
# powerlevel10k {{{

# if [[ ! -e ${ZPLUGINS}/powerlevel10k/ ]]; then
#     git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZPLUGINS}/powerlevel10k
# fi

# source ${ZPLUGINS}/powerlevel10k/powerlevel10k.zsh-theme
# powerlevel10k }}}
