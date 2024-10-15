# ENVs {{{
# homebrew
export HOMEBREW_FORCE_BREWED_CURL=1

# wine
export WINEPREFIX=$HOME/WINE_Library
export DXVK_HUD=1
# ENVs }}}
# PATH {{{
path=(/usr/local/opt/gsed/libexec/gnubin /usr/local/opt/curl/bin /usr/local/opt/gawk/libexec/gnubin /usr/local/opt/iftop/sbin /usr/local/opt/unzip/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/local/opt/gnu-tar/libexec/gnubin /usr/local/opt/gnu-indent/libexec/gnubin /usr/local/opt/grep/libexec/gnubin /usr/local/opt/make/libexec/gnubin/ /usr/local/opt/libpcap/bin $path)

path=(/usr/local/opt/openjdk/bin $path)

# c++
path=(/usr/local/opt/gettext/bin $path)

# openssl
path=(/usr/local/opt/openssl@3/bin $path)

# llvm
path=(/usr/local/opt/llvm/bin $path)

# bison
path=(/usr/local/Cellar/bison/3.8.2/bin/ $path)

# qt5
path=(/usr/local/opt/qt@5/bin $path)

# bin_macos
path=($HOME/myscripts/bin_macos $path)

export PATH
# PATH }}}
# pyenv {{{
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - --no-rehash)"
# pyenv }}}
