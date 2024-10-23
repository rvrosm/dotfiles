# Completion {{{
# zstyle :compinstall filename "$$HOME/.zshrc"
fpath=($HOME/.zsh/completion $HOME/.zsh/functions $fpath)
autoload -Uz compinit; compinit -C

zmodload zsh/complist

# :completion:<function>:<completer>:<command>:<argument>:<tag>
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' complete-options true
zstyle ':completion:*' case-insensitive yes
zstyle ':completion:*' completer _complete _extensions _match _approximate _expand_alias _ignored _directories _files 

zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*' list-suffixes true

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:cp:*' file-sort modification

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zsh/cache
zstyle ':completion:*' rehash true
#
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:corrections' format $'\e[93m -- %d (errors: %e) --\e[0m'
zstyle ':completion:*:descriptions' format $'\e[2m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[91m -- No Matches Found --\e[0m'

zstyle ':completion:*' menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
# Completion }}}
# ENVs {{{
# Basic {{{
export _zdir=~/.zsh/plugins
export EDITOR=vim
export VISUAL=vim
export TERM=alacritty
export LANG=en_US.UTF-8
# Basic }}}
# History {{{
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000    # Maximum events for internal history
export SAVEHIST=10000    # Maximum events in history file

setopt HIST_FIND_NO_DUPS # Don't display duplicates when searching the history.
setopt HIST_IGNORE_DUPS  # Don't enter immediate duplicates into the history.
setopt HIST_IGNORE_SPACE # Remove commands from the history that begin with a space.
setopt HIST_VERIFY       # Don't execute the command directly upon history expansion.
setopt SHARE_HISTORY     # Cause all terminals to share the same history 'session'.

# History }}}
# PATH {{{
path=(/usr/local/bin /usr/local/sbin $path)

# go
path=($HOME/go/bin/ $HOME/.local/go/bin /usr/local/go/bin $path)

# Rust 
path=($HOME/.cargo/bin $path)

# local
path=($HOME/myscripts/bin/ $HOME/.local/bin $path)

export -U PATH
# PATH }}}
# Prompt {{{
export PROMPT='%1~ %# '
export RPROMPT='%n@%m'
# Prompt }}}
# Other Tools {{{
# Other Tools }}}
# ENVs }}}
# setopts {{{
unsetopt BEEP
# Perform cd to a directory if the typed command is invalid, but is a directory.
setopt AUTO_CD
# Don't print the working directory after a cd.
setopt CD_SILENT

setopt PUSHD_IGNORE_DUPS    # Don't push multiple copies of the same directory to the stack.
setopt PUSHD_SILENT         # Don't print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Have pushd without arguments act like `pushd ${HOME}`.
setopt AUTO_PUSHD
setopt PUSHD_MINUS

setopt EXTENDED_GLOB        # Treat `#`, `~`, and `^` as patterns for filename globbing.

setopt AUTO_CONTINUE
setopt PROMPT_SUBST
setopt INTERACTIVE_COMMENTS # Allow comments starting with `#` in the interactive shell.
# setopt NO_CLOBBER           # Disallow `>` to overwrite existing files. Use `>|` or `>!` instead.
setopt LONG_LIST_JOBS       # List jobs in verbose format by default.
setopt NO_BG_NICE           # Prevent background jobs being given a lower priority.
setopt NO_CHECK_JOBS        # Prevent status report of jobs on shell exit.
setopt NO_HUP               # Prevent SIGHUP to jobs on shell exit.
setopt LISTPACKED

setopt MAGIC_EQUAL_SUBST
setopt TRANSIENT_RPROMPT
setopt KSH_OPTION_PRINT
setopt NO_BG_NICE
setopt NOFLOWCONTROL

# setopts }}}
# Aliases {{{
# dotfiles
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# git
alias Gc='git clone'
alias Gm='git commit'
alias Gp='git push'
alias Gl='git pull'

alias up=uptime
alias un=uname
alias ua='uname -a'

alias pa="gopass"
alias pai="gopass insert"
alias pae="gopass edit"

alias ls='ls --color=always'
alias la="ls -a"
alias ll="ls -ltr"
alias yd="yt-dlp"
alias ymp3="yt-dlp -x --audio-format mp3 --audio-quality 0"

# eza
alias er='eza --icons=auto'

alias au="arc unarchive"
alias ff="fastfetch"
alias fe="fastfetch -c $HOME/.config/fastfetch/neofetch.jsonc"
alias hf=hyperfine

alias bat="bat --color=always"

# docker
alias dp="docker compose"
alias di="docker image"
alias dis="docker images"
alias dc="docker container"
alias dr='docker run --detach-keys="ctrl-z,ctrl-q"'
alias dx='docker container exec --detach-keys="ctrl-z,ctrl-q" -it'

# duf
alias ds="duf --only local"

## python
alias py="python3"
alias pye="pyenv"
alias pipe="pipenv"

# rm - rip
alias rip='rip --graveyard ~/.local/share/Trash'

# Aliases }}}
# bindkey {{{
bindkey -e
# bindkey }}}
# Functions {{{
 
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * && $UID -ne 0 ]] && {
      typeset -a bufs
      bufs=(${(z)BUFFER})
      while (( $+aliases[$bufs[1]] )); do
        local expanded=(${(z)aliases[$bufs[1]]})
        bufs[1,1]=($expanded)
        if [[ $bufs[1] == $expanded[1] ]]; then
          break
        fi
      done
      bufs=(sudo $bufs)
      BUFFER=$bufs
    }
    zle end-of-line
}
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line

# Functions }}}
# Load Plugins {{{
source ~/.config/zsh/plugins.zsh
# Load Plugins }}}
# Load Tools {{{
# fzf {{{
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
source <(fzf --zsh)
# fzf }}}
# Cheat {{{
export CHEAT_USE_FZF=true
# Cheat }}}
# pyenv {{{
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export -U PATH="$PYENV_ROOT/bin:$PATH" 
# eval "$(pyenv init - --no-rehash)"
# pyenv }}}
# Load Tools }}}
# ostype {{{
if [[ `uname` == "Linux" ]]; then
    [[ -f  $HOME/.config/zsh/linux.zsh ]] && source $HOME/.config/zsh/linux.zsh
else
    [[ -f $HOME/.config/zsh/macOS.zsh ]] && source $HOME/.config/zsh/macOS.zsh
fi

[[ -f $HOME/.config/zsh/local.zshrc ]] && source $HOME/.config/zsh/local.zshrc
# ostype }}}
# LS_COLORS {{{
export LS_COLORS='*~=0;38;2;102;102;102:bd=0;38;2;154;237;254;48;2;51;51;51:ca=0:cd=0;38;2;255;106;193;48;2;51;51;51:di=0;38;2;87;199;255:do=0;38;2;0;0;0;48;2;255;106;193:ex=1;38;2;255;92;87:fi=0:ln=0;38;2;255;106;193:mh=0:mi=0;38;2;0;0;0;48;2;255;92;87:no=0:or=0;38;2;0;0;0;48;2;255;92;87:ow=0:pi=0;38;2;0;0;0;48;2;87;199;255:rs=0:sg=0:so=0;38;2;0;0;0;48;2;255;106;193:st=0:su=0:tw=0:*.1=0;38;2;243;249;157:*.a=1;38;2;255;92;87:*.c=0;38;2;90;247;142:*.d=0;38;2;90;247;142:*.h=0;38;2;90;247;142:*.m=0;38;2;90;247;142:*.o=0;38;2;102;102;102:*.p=0;38;2;90;247;142:*.r=0;38;2;90;247;142:*.t=0;38;2;90;247;142:*.v=0;38;2;90;247;142:*.z=4;38;2;154;237;254:*.7z=4;38;2;154;237;254:*.ai=0;38;2;255;180;223:*.as=0;38;2;90;247;142:*.bc=0;38;2;102;102;102:*.bz=4;38;2;154;237;254:*.cc=0;38;2;90;247;142:*.cp=0;38;2;90;247;142:*.cr=0;38;2;90;247;142:*.cs=0;38;2;90;247;142:*.db=4;38;2;154;237;254:*.di=0;38;2;90;247;142:*.el=0;38;2;90;247;142:*.ex=0;38;2;90;247;142:*.fs=0;38;2;90;247;142:*.go=0;38;2;90;247;142:*.gv=0;38;2;90;247;142:*.gz=4;38;2;154;237;254:*.ha=0;38;2;90;247;142:*.hh=0;38;2;90;247;142:*.hi=0;38;2;102;102;102:*.hs=0;38;2;90;247;142:*.jl=0;38;2;90;247;142:*.js=0;38;2;90;247;142:*.ko=1;38;2;255;92;87:*.kt=0;38;2;90;247;142:*.la=0;38;2;102;102;102:*.ll=0;38;2;90;247;142:*.lo=0;38;2;102;102;102:*.ma=0;38;2;255;180;223:*.mb=0;38;2;255;180;223:*.md=0;38;2;243;249;157:*.mk=0;38;2;165;255;195:*.ml=0;38;2;90;247;142:*.mn=0;38;2;90;247;142:*.nb=0;38;2;90;247;142:*.nu=0;38;2;90;247;142:*.pl=0;38;2;90;247;142:*.pm=0;38;2;90;247;142:*.pp=0;38;2;90;247;142:*.ps=0;38;2;255;92;87:*.py=0;38;2;90;247;142:*.rb=0;38;2;90;247;142:*.rm=0;38;2;255;180;223:*.rs=0;38;2;90;247;142:*.sh=0;38;2;90;247;142:*.so=1;38;2;255;92;87:*.td=0;38;2;90;247;142:*.ts=0;38;2;90;247;142:*.ui=0;38;2;243;249;157:*.vb=0;38;2;90;247;142:*.wv=0;38;2;255;180;223:*.xz=4;38;2;154;237;254:*FAQ=0;38;2;40;42;54;48;2;243;249;157:*.3ds=0;38;2;255;180;223:*.3fr=0;38;2;255;180;223:*.3mf=0;38;2;255;180;223:*.adb=0;38;2;90;247;142:*.ads=0;38;2;90;247;142:*.aif=0;38;2;255;180;223:*.amf=0;38;2;255;180;223:*.ape=0;38;2;255;180;223:*.apk=4;38;2;154;237;254:*.ari=0;38;2;255;180;223:*.arj=4;38;2;154;237;254:*.arw=0;38;2;255;180;223:*.asa=0;38;2;90;247;142:*.asm=0;38;2;90;247;142:*.aux=0;38;2;102;102;102:*.avi=0;38;2;255;180;223:*.awk=0;38;2;90;247;142:*.bag=4;38;2;154;237;254:*.bak=0;38;2;102;102;102:*.bat=1;38;2;255;92;87:*.bay=0;38;2;255;180;223:*.bbl=0;38;2;102;102;102:*.bcf=0;38;2;102;102;102:*.bib=0;38;2;243;249;157:*.bin=4;38;2;154;237;254:*.blg=0;38;2;102;102;102:*.bmp=0;38;2;255;180;223:*.bsh=0;38;2;90;247;142:*.bst=0;38;2;243;249;157:*.bz2=4;38;2;154;237;254:*.c++=0;38;2;90;247;142:*.cap=0;38;2;255;180;223:*.cfg=0;38;2;243;249;157:*.cgi=0;38;2;90;247;142:*.clj=0;38;2;90;247;142:*.com=1;38;2;255;92;87:*.cpp=0;38;2;90;247;142:*.cr2=0;38;2;255;180;223:*.cr3=0;38;2;255;180;223:*.crw=0;38;2;255;180;223:*.css=0;38;2;90;247;142:*.csv=0;38;2;243;249;157:*.csx=0;38;2;90;247;142:*.cxx=0;38;2;90;247;142:*.dae=0;38;2;255;180;223:*.dcr=0;38;2;255;180;223:*.dcs=0;38;2;255;180;223:*.deb=4;38;2;154;237;254:*.def=0;38;2;90;247;142:*.dll=1;38;2;255;92;87:*.dmg=4;38;2;154;237;254:*.dng=0;38;2;255;180;223:*.doc=0;38;2;255;92;87:*.dot=0;38;2;90;247;142:*.dox=0;38;2;165;255;195:*.dpr=0;38;2;90;247;142:*.drf=0;38;2;255;180;223:*.dxf=0;38;2;255;180;223:*.eip=0;38;2;255;180;223:*.elc=0;38;2;90;247;142:*.elm=0;38;2;90;247;142:*.epp=0;38;2;90;247;142:*.eps=0;38;2;255;180;223:*.erf=0;38;2;255;180;223:*.erl=0;38;2;90;247;142:*.exe=1;38;2;255;92;87:*.exr=0;38;2;255;180;223:*.exs=0;38;2;90;247;142:*.fbx=0;38;2;255;180;223:*.fff=0;38;2;255;180;223:*.fls=0;38;2;102;102;102:*.flv=0;38;2;255;180;223:*.fnt=0;38;2;255;180;223:*.fon=0;38;2;255;180;223:*.fsi=0;38;2;90;247;142:*.fsx=0;38;2;90;247;142:*.gif=0;38;2;255;180;223:*.git=0;38;2;102;102;102:*.gpr=0;38;2;255;180;223:*.gvy=0;38;2;90;247;142:*.h++=0;38;2;90;247;142:*.hda=0;38;2;255;180;223:*.hip=0;38;2;255;180;223:*.hpp=0;38;2;90;247;142:*.htc=0;38;2;90;247;142:*.htm=0;38;2;243;249;157:*.hxx=0;38;2;90;247;142:*.ico=0;38;2;255;180;223:*.ics=0;38;2;255;92;87:*.idx=0;38;2;102;102;102:*.igs=0;38;2;255;180;223:*.iiq=0;38;2;255;180;223:*.ilg=0;38;2;102;102;102:*.img=4;38;2;154;237;254:*.inc=0;38;2;90;247;142:*.ind=0;38;2;102;102;102:*.ini=0;38;2;243;249;157:*.inl=0;38;2;90;247;142:*.ino=0;38;2;90;247;142:*.ipp=0;38;2;90;247;142:*.iso=4;38;2;154;237;254:*.jar=4;38;2;154;237;254:*.jpg=0;38;2;255;180;223:*.jsx=0;38;2;90;247;142:*.jxl=0;38;2;255;180;223:*.k25=0;38;2;255;180;223:*.kdc=0;38;2;255;180;223:*.kex=0;38;2;255;92;87:*.kra=0;38;2;255;180;223:*.kts=0;38;2;90;247;142:*.log=0;38;2;102;102;102:*.ltx=0;38;2;90;247;142:*.lua=0;38;2;90;247;142:*.m3u=0;38;2;255;180;223:*.m4a=0;38;2;255;180;223:*.m4v=0;38;2;255;180;223:*.mdc=0;38;2;255;180;223:*.mef=0;38;2;255;180;223:*.mid=0;38;2;255;180;223:*.mir=0;38;2;90;247;142:*.mkv=0;38;2;255;180;223:*.mli=0;38;2;90;247;142:*.mos=0;38;2;255;180;223:*.mov=0;38;2;255;180;223:*.mp3=0;38;2;255;180;223:*.mp4=0;38;2;255;180;223:*.mpg=0;38;2;255;180;223:*.mrw=0;38;2;255;180;223:*.msi=4;38;2;154;237;254:*.mtl=0;38;2;255;180;223:*.nef=0;38;2;255;180;223:*.nim=0;38;2;90;247;142:*.nix=0;38;2;243;249;157:*.nrw=0;38;2;255;180;223:*.obj=0;38;2;255;180;223:*.obm=0;38;2;255;180;223:*.odp=0;38;2;255;92;87:*.ods=0;38;2;255;92;87:*.odt=0;38;2;255;92;87:*.ogg=0;38;2;255;180;223:*.ogv=0;38;2;255;180;223:*.orf=0;38;2;255;180;223:*.org=0;38;2;243;249;157:*.otf=0;38;2;255;180;223:*.otl=0;38;2;255;180;223:*.out=0;38;2;102;102;102:*.pas=0;38;2;90;247;142:*.pbm=0;38;2;255;180;223:*.pcx=0;38;2;255;180;223:*.pdf=0;38;2;255;92;87:*.pef=0;38;2;255;180;223:*.pgm=0;38;2;255;180;223:*.php=0;38;2;90;247;142:*.pid=0;38;2;102;102;102:*.pkg=4;38;2;154;237;254:*.png=0;38;2;255;180;223:*.pod=0;38;2;90;247;142:*.ppm=0;38;2;255;180;223:*.pps=0;38;2;255;92;87:*.ppt=0;38;2;255;92;87:*.pro=0;38;2;165;255;195:*.ps1=0;38;2;90;247;142:*.psd=0;38;2;255;180;223:*.ptx=0;38;2;255;180;223:*.pxn=0;38;2;255;180;223:*.pyc=0;38;2;102;102;102:*.pyd=0;38;2;102;102;102:*.pyo=0;38;2;102;102;102:*.qoi=0;38;2;255;180;223:*.r3d=0;38;2;255;180;223:*.raf=0;38;2;255;180;223:*.rar=4;38;2;154;237;254:*.raw=0;38;2;255;180;223:*.rpm=4;38;2;154;237;254:*.rst=0;38;2;243;249;157:*.rtf=0;38;2;255;92;87:*.rw2=0;38;2;255;180;223:*.rwl=0;38;2;255;180;223:*.rwz=0;38;2;255;180;223:*.sbt=0;38;2;90;247;142:*.sql=0;38;2;90;247;142:*.sr2=0;38;2;255;180;223:*.srf=0;38;2;255;180;223:*.srw=0;38;2;255;180;223:*.stl=0;38;2;255;180;223:*.stp=0;38;2;255;180;223:*.sty=0;38;2;102;102;102:*.svg=0;38;2;255;180;223:*.swf=0;38;2;255;180;223:*.swp=0;38;2;102;102;102:*.sxi=0;38;2;255;92;87:*.sxw=0;38;2;255;92;87:*.tar=4;38;2;154;237;254:*.tbz=4;38;2;154;237;254:*.tcl=0;38;2;90;247;142:*.tex=0;38;2;90;247;142:*.tga=0;38;2;255;180;223:*.tgz=4;38;2;154;237;254:*.tif=0;38;2;255;180;223:*.tml=0;38;2;243;249;157:*.tmp=0;38;2;102;102;102:*.toc=0;38;2;102;102;102:*.tsx=0;38;2;90;247;142:*.ttf=0;38;2;255;180;223:*.txt=0;38;2;243;249;157:*.typ=0;38;2;243;249;157:*.usd=0;38;2;255;180;223:*.vcd=4;38;2;154;237;254:*.vim=0;38;2;90;247;142:*.vob=0;38;2;255;180;223:*.vsh=0;38;2;90;247;142:*.wav=0;38;2;255;180;223:*.wma=0;38;2;255;180;223:*.wmv=0;38;2;255;180;223:*.wrl=0;38;2;255;180;223:*.x3d=0;38;2;255;180;223:*.x3f=0;38;2;255;180;223:*.xlr=0;38;2;255;92;87:*.xls=0;38;2;255;92;87:*.xml=0;38;2;243;249;157:*.xmp=0;38;2;243;249;157:*.xpm=0;38;2;255;180;223:*.xvf=0;38;2;255;180;223:*.yml=0;38;2;243;249;157:*.zig=0;38;2;90;247;142:*.zip=4;38;2;154;237;254:*.zsh=0;38;2;90;247;142:*.zst=4;38;2;154;237;254:*TODO=1:*hgrc=0;38;2;165;255;195:*.avif=0;38;2;255;180;223:*.bash=0;38;2;90;247;142:*.braw=0;38;2;255;180;223:*.conf=0;38;2;243;249;157:*.dart=0;38;2;90;247;142:*.data=0;38;2;255;180;223:*.diff=0;38;2;90;247;142:*.docx=0;38;2;255;92;87:*.epub=0;38;2;255;92;87:*.fish=0;38;2;90;247;142:*.flac=0;38;2;255;180;223:*.h264=0;38;2;255;180;223:*.hack=0;38;2;90;247;142:*.heif=0;38;2;255;180;223:*.hgrc=0;38;2;165;255;195:*.html=0;38;2;243;249;157:*.iges=0;38;2;255;180;223:*.info=0;38;2;243;249;157:*.java=0;38;2;90;247;142:*.jpeg=0;38;2;255;180;223:*.json=0;38;2;243;249;157:*.less=0;38;2;90;247;142:*.lisp=0;38;2;90;247;142:*.lock=0;38;2;102;102;102:*.make=0;38;2;165;255;195:*.mojo=0;38;2;90;247;142:*.mpeg=0;38;2;255;180;223:*.nims=0;38;2;90;247;142:*.opus=0;38;2;255;180;223:*.orig=0;38;2;102;102;102:*.pptx=0;38;2;255;92;87:*.prql=0;38;2;90;247;142:*.psd1=0;38;2;90;247;142:*.psm1=0;38;2;90;247;142:*.purs=0;38;2;90;247;142:*.raku=0;38;2;90;247;142:*.rlib=0;38;2;102;102;102:*.sass=0;38;2;90;247;142:*.scad=0;38;2;90;247;142:*.scss=0;38;2;90;247;142:*.step=0;38;2;255;180;223:*.tbz2=4;38;2;154;237;254:*.tiff=0;38;2;255;180;223:*.toml=0;38;2;243;249;157:*.usda=0;38;2;255;180;223:*.usdc=0;38;2;255;180;223:*.usdz=0;38;2;255;180;223:*.webm=0;38;2;255;180;223:*.webp=0;38;2;255;180;223:*.woff=0;38;2;255;180;223:*.xbps=4;38;2;154;237;254:*.xlsx=0;38;2;255;92;87:*.yaml=0;38;2;243;249;157:*stdin=0;38;2;102;102;102:*v.mod=0;38;2;165;255;195:*.blend=0;38;2;255;180;223:*.cabal=0;38;2;90;247;142:*.cache=0;38;2;102;102;102:*.class=0;38;2;102;102;102:*.cmake=0;38;2;165;255;195:*.ctags=0;38;2;102;102;102:*.dylib=1;38;2;255;92;87:*.dyn_o=0;38;2;102;102;102:*.gcode=0;38;2;90;247;142:*.ipynb=0;38;2;90;247;142:*.mdown=0;38;2;243;249;157:*.patch=0;38;2;90;247;142:*.rmeta=0;38;2;102;102;102:*.scala=0;38;2;90;247;142:*.shtml=0;38;2;243;249;157:*.swift=0;38;2;90;247;142:*.toast=4;38;2;154;237;254:*.woff2=0;38;2;255;180;223:*.xhtml=0;38;2;243;249;157:*Icon=0;38;2;102;102;102:*LEGACY=0;38;2;40;42;54;48;2;243;249;157:*NOTICE=0;38;2;40;42;54;48;2;243;249;157:*README=0;38;2;40;42;54;48;2;243;249;157:*go.mod=0;38;2;165;255;195:*go.sum=0;38;2;102;102;102:*passwd=0;38;2;243;249;157:*shadow=0;38;2;243;249;157:*stderr=0;38;2;102;102;102:*stdout=0;38;2;102;102;102:*.bashrc=0;38;2;90;247;142:*.config=0;38;2;243;249;157:*.dyn_hi=0;38;2;102;102;102:*.flake8=0;38;2;165;255;195:*.gradle=0;38;2;90;247;142:*.groovy=0;38;2;90;247;142:*.ignore=0;38;2;165;255;195:*.matlab=0;38;2;90;247;142:*.nimble=0;38;2;90;247;142:*COPYING=0;38;2;153;153;153:*INSTALL=0;38;2;40;42;54;48;2;243;249;157:*LICENCE=0;38;2;153;153;153:*LICENSE=0;38;2;153;153;153:*TODO.md=1:*VERSION=0;38;2;40;42;54;48;2;243;249;157:*.alembic=0;38;2;255;180;223:*.desktop=0;38;2;243;249;157:*.gemspec=0;38;2;165;255;195:*.mailmap=0;38;2;165;255;195:*Doxyfile=0;38;2;165;255;195:*Makefile=0;38;2;165;255;195:*TODO.txt=1:*setup.py=0;38;2;165;255;195:*.DS_Store=0;38;2;102;102;102:*.cmake.in=0;38;2;165;255;195:*.fdignore=0;38;2;165;255;195:*.kdevelop=0;38;2;165;255;195:*.markdown=0;38;2;243;249;157:*.rgignore=0;38;2;165;255;195:*.tfignore=0;38;2;165;255;195:*CHANGELOG=0;38;2;40;42;54;48;2;243;249;157:*COPYRIGHT=0;38;2;153;153;153:*README.md=0;38;2;40;42;54;48;2;243;249;157:*bun.lockb=0;38;2;102;102;102:*configure=0;38;2;165;255;195:*.gitconfig=0;38;2;165;255;195:*.gitignore=0;38;2;165;255;195:*.localized=0;38;2;102;102;102:*.scons_opt=0;38;2;102;102;102:*.timestamp=0;38;2;102;102;102:*CODEOWNERS=0;38;2;165;255;195:*Dockerfile=0;38;2;243;249;157:*INSTALL.md=0;38;2;40;42;54;48;2;243;249;157:*README.txt=0;38;2;40;42;54;48;2;243;249;157:*SConscript=0;38;2;165;255;195:*SConstruct=0;38;2;165;255;195:*.cirrus.yml=0;38;2;90;247;142:*.gitmodules=0;38;2;165;255;195:*.synctex.gz=0;38;2;102;102;102:*.travis.yml=0;38;2;90;247;142:*INSTALL.txt=0;38;2;40;42;54;48;2;243;249;157:*LICENSE-MIT=0;38;2;153;153;153:*MANIFEST.in=0;38;2;165;255;195:*Makefile.am=0;38;2;165;255;195:*Makefile.in=0;38;2;102;102;102:*.applescript=0;38;2;90;247;142:*.fdb_latexmk=0;38;2;102;102;102:*.webmanifest=0;38;2;243;249;157:*CHANGELOG.md=0;38;2;40;42;54;48;2;243;249;157:*CONTRIBUTING=0;38;2;40;42;54;48;2;243;249;157:*CONTRIBUTORS=0;38;2;40;42;54;48;2;243;249;157:*appveyor.yml=0;38;2;90;247;142:*configure.ac=0;38;2;165;255;195:*.bash_profile=0;38;2;90;247;142:*.clang-format=0;38;2;165;255;195:*.editorconfig=0;38;2;165;255;195:*CHANGELOG.txt=0;38;2;40;42;54;48;2;243;249;157:*.gitattributes=0;38;2;165;255;195:*.gitlab-ci.yml=0;38;2;90;247;142:*CMakeCache.txt=0;38;2;102;102;102:*CMakeLists.txt=0;38;2;165;255;195:*LICENSE-APACHE=0;38;2;153;153;153:*pyproject.toml=0;38;2;165;255;195:*CODE_OF_CONDUCT=0;38;2;40;42;54;48;2;243;249;157:*CONTRIBUTING.md=0;38;2;40;42;54;48;2;243;249;157:*CONTRIBUTORS.md=0;38;2;40;42;54;48;2;243;249;157:*.sconsign.dblite=0;38;2;102;102;102:*CONTRIBUTING.txt=0;38;2;40;42;54;48;2;243;249;157:*CONTRIBUTORS.txt=0;38;2;40;42;54;48;2;243;249;157:*requirements.txt=0;38;2;165;255;195:*package-lock.json=0;38;2;102;102;102:*CODE_OF_CONDUCT.md=0;38;2;40;42;54;48;2;243;249;157:*.CFUserTextEncoding=0;38;2;102;102;102:*CODE_OF_CONDUCT.txt=0;38;2;40;42;54;48;2;243;249;157:*azure-pipelines.yml=0;38;2;90;247;142'
# LS_COLORS }}}
