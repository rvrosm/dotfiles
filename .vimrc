" runtimepath {{{
set runtimepath^=$HOME/.vim/myplugin
" }}}
" vim-plug Plugins {{{
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" macOS {{{
if has("mac")
    Plug 'lyokha/vim-xkbswitch'
endif
" }}}
" IDE {{{
" vim-lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" auto complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'hiterm/asyncomplete-look'
" make comple slow
" Plug 'yami-beta/asyncomplete-omni.vim'
"
" ale lint
" Plug 'dense-analysis/ale'
" auto complete tag 
Plug 'mattn/emmet-vim'

" ultisnips 
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" fzf 
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" tagbar 
" Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'


" debug
Plug 'puremourning/vimspector'

" janet
Plug 'bakpakin/janet.vim'

" vim-go {{{
Plug 'fatih/vim-go'
" Plug 'AndrewRadev/splitjoin.vim'
" go }}}

" python {{{
Plug 'vim-python/python-syntax'
" python }}}

" }}}
" miscs {{{

                                       " Plug 'cespare/vim-toml'
                                       " Plug 'elzr/vim-json', {'for' : 'json'}
                                       " Plug 'plasticboy/vim-markdown'
                                       " Plug 'tommcdo/vim-lion'
                                       " Plug 'tpope/vim-repeat' " less plugin the better
                                       " Plug 'tpope/vim-rsi' " deprecated
                                       " Plug 'tpope/vim-scriptease' " I don't need it
                                       " Plug 'tpope/vim-surround' " deprecated
                                       " Plug 'dhruvasagar/vim-table-mode'
Plug 'ConradIrwin/vim-bracketed-paste' " vim-bracketed-paste enables transparent pasting into vim. (i.e. no more :set paste!)
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-sandwich'
" Plug 'tpope/vim-commentary'            " gc, gc<motion>, gcap
Plug 'tpope/vim-fugitive'
Plug 't9md/vim-choosewin'

" }}}
" colors {{{
" Plug 'lifepillar/vim-colortemplate'
Plug 'connorholyday/vim-snazzy'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Plug 'nordtheme/vim', {'tags': '0.19.0', 'as': 'nordtheme'} " comment not clear
" Plug 'jacoborus/tender.vim'
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'catppuccin/vim', { 'as': 'catppuccin' }
" Plug 'edkolev/tmuxline.vim'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'joshdick/onedark.vim'
" Plug 'ayu-theme/ayu-vim'
" Plug 'gkeep/iceberg-dark'
" plug 'nlknguyen/papercolor-theme'
" plug 'bluz71/vim-moonfly-colors'
" Plug 'ghifarit53/tokyonight-vim'
" Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
" Plug 'joshdick/onedark.vim'
" Plug 'connorholyday/vim-snazzy'                             " not clear
" Plug 'sonph/onehalf'                                        " buggy
" Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'endel/vim-github-colorscheme'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'bling/vim-bufferline'
" Plug 'catppuccin/vim', { 'as': 'catppuccin' }
" Plug 'cocopon/iceberg.vim',

" }}}
call plug#end()
" vim-plug Plugins }}}
" packadd {{{
packadd! comment
" packadd }}}
" Settings {{{

" Defaults {{{
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
" Defaults }}}
" General {{{
set nocompatible nolangremap lazyredraw
set fillchars+=vert:\│,eob:.
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬
scriptencoding utf-8
set noerrorbells belloff+=ctrlg " If Vim beeps during completion
set conceallevel=2              " Concealed text is completely hidden
set nocursorline
set display=truncate
set encoding=utf-8
set fileformats=unix,mac,dos    " Prefer Unix over Windows over OS 9 formats
set wrap wrapscan tw=0          " If it is zero then 79 is used :verbose setlocal formatoptions?
set formatoptions+=cqnmMB1j     " all:tcroqwan2vblmMB1j  r: Automatically insert the current comment leader after hitting <Enter> in Insert mode.
set formatoptions-=trowa2vbl    " o: Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set nrformats-=octal
set grepprg=rg
set ignorecase  smartcase               
set iminsert=0
set imsearch=-1
set maxmempattern=20000         " increase max memory to show syntax highlighting for large files
set mouse=    ttymouse=         " Disable mouse 
set noimcmdline noimdisable
set showcmd showmode               
set noswapfile nowritebackup hidden nobackup autoread autowrite   
set sessionoptions-=options
set shiftround               
set shortmess=acTI
" set sidescroll=1 sidescrolloff=3 scrolloff=3     
set splitbelow splitright              
set updatetime=100
set viewoptions-=options
set virtualedit=block
set wildmenu
set laststatus=0                " never a status line

" ~/.viminfo needs to be writable and readable. Set oldfiles to 1000 last
" recently opened files, :FzfHistory uses it
set viminfo='1000
if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

" }}}
" Filetype {{{
autocmd BufRead,BufNewFile ~/.zimrc set filetype=zsh
" Filetype }}}
" colors and highlight {{{
set termguicolors
set background=dark
" colorscheme habamax
colorscheme snazzy


augroup colorscheme
autocmd!
autocmd ColorScheme * highlight VertSplit guibg=bg
" tabline color hsl(0, 0%, 25.1%)
autocmd ColorScheme * highlight Tabline guibg=bg guifg='#646464' 
autocmd ColorScheme * highlight TablineFill guibg=bg 
autocmd ColorScheme * highlight TablineSel cterm=reverse,bold guifg='#646464'
augroup END



set noshowmatch nocursorcolumn incsearch           

augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END


" }}}
" IDE {{{
 
set balloondelay=250         " Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short balloondelay
set number signcolumn=number 
syntax enable                " :syntax enable only sets groups that weren't set yet. :syntax on overrules existing colors
filetype plugin indent on
set autoindent smartindent breakindent
set backspace=2              " same as :set backspace=indent,eol,start"
set completeopt=menuone,preview,popup,noinsert
set completepopup=align:menu,border:off,highlight:Pmenu

" }}}
" tabstop {{{
set shiftwidth=4 softtabstop=4 noexpandtab " tabstop
augroup tabstop_settings
    autocmd!
    autocmd BufNewFile,BufRead *.{y[a]?ml,tmpl,html,vim,janet,conf} setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd BufNewFile,BufRead *.py setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" tabstop }}}
" Folding {{{

set foldmethod=marker
augroup foldmethod_settings
  autocmd!
  autocmd FileType vim,snippets,tmux setlocal foldmethod=marker
  " autocmd FileType go setlocal foldmethod=syntax 
augroup END

" }}}
" gopass {{{
if has("mac")
    autocmd BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile viminfo=""
else
    autocmd BufNewFile,BufRead /dev/shm/gopass* setlocal noswapfile nobackup noundofile viminfo=""
endif
" gopass }}}

" Settings }}}
" Mappings {{{
" leader & general {{{
" let mapleader = "\<space>"
" let mapleader=";"
let mapleader=","
nnoremap \ ,
nnoremap <silent> <leader>, ,

" nnoremap <leader>mc :mapclear <buffer><cr>
" }}}
" help page {{{
nnoremap <leader>h :tab h<space>
" }}}
" vimrc {{{
nnoremap <leader><C-E> :tabnew $MYVIMRC<CR>
nnoremap <leader><C-R> :source $MYVIMRC<CR>
" }}}
" movement {{{
nnoremap j gj
nnoremap k gk
nnoremap n nzzzv " These will make it so that going to the next one in a search will center on the line it's found in.
nnoremap N Nzzzv

" tags {{{
nnoremap <C-T> <C-T>zzzv
nnoremap ]t :tag<cr>zzzv
" nnoremap gas :tags<cr>
" nnoremap gap :pop<cr>zzzv

" nnoremap [[ [[zOzt
" nnoremap ]] ]]zOzt
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

nnoremap <silent> <space> <C-F>
nnoremap <silent> <leader><space> <C-B>

" }}}
" Insert Mode {{{

" Enter automatically into the files directory
" autocmd BufEnter * silent! lcd %:p:h
" map <leader>cd :pwd<cr>
"map <leader>wp :echo expand("%:p")<cr>
" nnoremap <leader>lcd :lcd %:p:h<cr>:pwd<cr>
" nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" move
inoremap <C-A> <C-O>^
inoremap <C-E> <C-O>$
inoremap <C-F> <Right>
inoremap <C-B> <Left>
" inoremap <C-P> <UP>
" inoremap <C-N> <Down>

" delete and cut
" CTRL-W CTRL-U is already exists  same as shell
inoremap <C-D> <C-O>dl
inoremap <C-K> <C-O>d$
" }}}

" autopairs {{{
inoremap `. ``<left>
inoremap ". ""<left>
inoremap '. ''<left>
inoremap (. ()<left>
inoremap [. []<left>
inoremap {. {}<left>
inoremap (<cr> (<CR>)<C-o>O
inoremap {<cr> {<CR>}<C-o>O
inoremap [<cr> [<CR>]<C-o>O
inoremap {,<cr> {<CR>},<C-o>O
" autopairs }}}


" }}}
" copy & paste & registers {{{

vnoremap <leader>y "*y
nnoremap <leader>yy "*yy
nnoremap <leader>p "*p
nnoremap Y y$
"
"" reverse word
vnoremap <leader>R c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>

" }}}
" highlight {{{

" true black
" hsl(0, 0%, 50.2%) = #808080
" hsl(45,15,65)
nnoremap <leader>o1 :hi Normal guibg='#000000' guifg='#A6A08D'<cr>
" hsl(0, 0%, 60%) = #999999
nnoremap <leader>o2 :hi Normal guibg='#0c0c0c' guifg='#999999'<cr>
" hsl(0, 0%, 70%) = #b3b3b3
nnoremap <leader>o3 :hi Normal guibg='#1c1c1c' guifg='#b3b3b3'<cr>
" snazzy foreground
nnoremap <leader>oo :hi Normal guibg='#000000' guifg='#eff0eb'<cr>

nnoremap <silent> <silent> <leader>oh :noh<CR>
nnoremap <silent> <silent> <leader>L :redraw<CR>

" highlight }}}
" sessions {{{
" " Saving options in session and view files causes more problems than it
" solves, so disable it.
nnoremap <leader>S :mks! /Users/x/Session.vim<CR>
" }}}
" Tabs {{{

" new and close
nnoremap <silent> <C-E>n :tabnew<cr>
nnoremap <silent> <C-E>t :tab<space>
nnoremap <silent> <C-E>c :tabclose<CR>
nnoremap <silent> <C-E>q :tabclose<CR>

" only; close all others
nnoremap <silent> <C-E>o :tabonly<CR>


" select previous and next
" nnoremap <silent> <C-E>p gT
" nnoremap <silent> <C-E>n gt
nnoremap <silent> <C-P> gT
nnoremap <silent> <C-N> gt
" nnoremap <silent> <C-P> gT:if tabpagenr() == 1 | :bprevious | endif 

" select by moving around
" N/A

" select by number

" pitty these not working
nnoremap <silent> <C-1> 1gt
nnoremap <silent> <C-2> 2gt
nnoremap <silent> <C-3> 3gt
nnoremap <silent> <C-4> 4gt
nnoremap <silent> <C-5> 5gt
nnoremap <silent> <C-6> 6gt
nnoremap <silent> <C-7> 7gt
nnoremap <silent> <C-8> 8gt

" nnoremap <silent> <C-E>1 1gt
" nnoremap <silent> <C-E>2 2gt
" nnoremap <silent> <C-E>3 3gt
" nnoremap <silent> <C-E>4 4gt
" nnoremap <silent> <C-E>5 5gt
" nnoremap <silent> <C-E>6 6gt
" nnoremap <silent> <C-E>7 7gt
" nnoremap <silent> <C-E>8 8gt

" select first and last or say top and bottom
nnoremap <silent> <leader>tf :tabfirst<cr>
nnoremap <silent> <leader>tl :tablast<cr>
" nnoremap <silent> <C-E>^ :tabfirst<cr>
" nnoremap <silent> <C-E>$ :tablast<cr>
" nnoremap <silent> <C-E>0 :tabfirst<cr>
" nnoremap <silent> <C-E>9 :tablast<cr>

" select last accessed
" nnoremap <silent> <C-E><tab> g<tab>
" nnoremap <silent> <C-E>;     g<tab>


" move tabs around
nnoremap <silent> <C-E>H :tabmove -1<cr>
nnoremap <silent> <C-E>L :tabmove +1<cr>
nnoremap <silent> <C-E>< :tabmove -1<cr>
nnoremap <silent> <C-E>> :tabmove +1<cr>

" move tabs to first/last
nnoremap <silent> <C-E><C-h> :tabmove 0<cr>
nnoremap <silent> <C-E><C-l> :tabmove $<cr>

" rotate tabs

" list all
nnoremap <silent> <C-E>a :tabs<CR>
" }}}
" windows {{{
   
" new window and close
" nnoremap <silent> <C-w>c <C-w>n
nnoremap <silent> <C-w>q <C-w>c

" only; close all others
" nnoremap <silent> <C-w>C <C-w>o

" split

" select previous and next
nnoremap <silent> <C-w>p <C-w>W
nnoremap <silent> <C-w>n <C-w>w

" select by move around 
nnoremap <silent> <C-H> <C-w>h
nnoremap <silent> <C-J> <C-w>j
nnoremap <silent> <C-K> <C-w>k
nnoremap <silent> <C-L> <C-w>l

" select first and last or say top and bottom
" default
nnoremap <silent> <C-w>1 <C-w>t
nnoremap <silent> <C-w>2 <C-w>b<C-w>h
nnoremap <silent> <C-w>3 <C-w>t<C-w>l
nnoremap <silent> <C-w>4 <C-w>b

" select last accessed
nnoremap <silent> <C-w><tab> <C-w>p
nnoremap <silent> <C-w>;     <C-w>p

" move window around
" C-W_HJKL

" move window to first/last

" rotate window doesn't support much

" resize window
" default is C-W_-+<> _|
" width
nnoremap <silent> <C-w><C-h> 20<C-w><
nnoremap <silent> <C-w><C-l> 20<C-w>>
" height
nnoremap <silent> <C-w><C-j> 10<C-w>+
nnoremap <silent> <C-w><C-k> 10<C-w>-

" move window to new tab
" nnoremap <C-w><C-t> <C-w>T

nnoremap <silent> <leader>w :update<CR>
nnoremap <silent> <leader>W :wa<CR>
nnoremap <silent> <leader>x :x<CR>
nnoremap <silent> <leader>X :xa<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>Q :qa<CR>



" nnoremap <C-W><tab> <C-W>p

" }}}
" quickfix {{{
" q{0-9a-zA-Z"}		Record typed characters into register {0-9a-zA-Z"}
" mnemonics: quick record
" nnoremap qr q 
" nnoremap <silent> qq :cquit<cr>
nnoremap <silent> <leader>c :cclose<cr>
nnoremap <silent> [q :cprevious<cr>
nnoremap <silent> ]q :cnext<cr>
" quickfix }}}
" buffers {{{
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc

" go to next/previous buffer
" nnoremap <C-n> :bn<CR>
" nnoremap <C-p> :bp<CR>
" inoremap <C-n> <ESC>:bn<CR>
" inoremap <C-p> <ESC>:bp<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bn :bn<CR>

" Unload buffer and delete it from the buffer list.
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>bD :bd!<CR>
nnoremap <silent> <leader>bu :bu<CR>
" first && last
nnoremap <silent> <leader>br :br<CR>
nnoremap <silent> <leader>bl :bl<CR>
" }}}
" terminal {{{
nnoremap <silent> <leader>te :tab terminal<CR>
tnoremap <leader>q <C-\><C-n><C-w>q
" switch to normal mode with esc
tnoremap <Esc> <C-W>N
" Kill job and close terminal window
tnoremap <leader>c <C-w><C-C><C-w>c<cr>
" mappings to move out from terminal to other views
tnoremap <silent> <C-h> <C-w>h
tnoremap <silent> <C-j> <C-w>j
tnoremap <silent> <C-k> <C-w>k
tnoremap <silent> <C-l> <C-w>l

" }}}
" compile {{{
nnoremap <leader>mk :tab :make<CR>
" }}}
" EX mode {{{
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>
" }}}
" miscellaneous {{{
nnoremap <silent> <leader>u guiw
nnoremap <silent> <leader>U gUiw
" miscellaneous }}}
" }}}
" Plugin Configs {{{

" IDE {{{

" asynccomplete auto complete {{{
" this option set to 1 will set noselect 
let g:asyncomplete_auto_completeopt = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <C-n>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<C-n>" :
  \ asyncomplete#force_refresh()
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>"

" inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

augroup asynccomplete
autocmd!
autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['text','markdown'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))

autocmd User aysnccomplete_setup call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
    \ 'name': 'ultisnips',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
    \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'look_good_words',
    \ 'allowlist': ['text', 'markdown'],
    \ 'completor': function('asyncomplete#sources#look#good_words'),
    \ })

" autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
" \ 'name': 'omni',
" \ 'allowlist': ['*'],
" \ 'completor': function('asyncomplete#sources#omni#completor'),
" \ 'config': {
" \   'show_source_kind': 1,
" \ },
" \ }))

augroup END
" }}}
" vim-lsp {{{

let g:lsp_use_native_client = 1
let g:lsp_semantic_enabled = 1

let g:lsp_diagnostics_enabled  = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0
let g:lsp_diagnostics_virtual_text_align = "right"
let g:lsp_diagnostics_echo_cursor = 0

let g:lsp_document_code_action_signs_enabled = 0

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nnoremap <buffer> gd  <plug>(lsp-definition)
    nnoremap <buffer> gD  <plug>(lsp-type-definition)
    nnoremap <buffer> gls  <plug>(lsp-document-symbol-search)
    nnoremap <buffer> glS  <plug>(lsp-workspace-symbol-search)
    nnoremap <buffer> glr  <plug>(lsp-references)
    nnoremap <buffer> glR  <plug>(lsp-rename)
    nnoremap <buffer> <leader>gi  <plug>(lsp-implementation)
    nnoremap <buffer> [d  <plug>(lsp-previous-diagnostic)
    nnoremap <buffer> ]d  <plug>(lsp-next-diagnostic)
    nnoremap <buffer> K   <plug>(lsp-hover)
    nnoremap <buffer> gld <plug>(lsp-peak-definition)
    nnoremap <buffer> glD <plug>(lsp-peak-declaration)
    nnoremap <buffer> glI <plug>(lsp-peak-implementation)
    nnoremap <buffer> glt <plug>(lsp-peak-type-definition)
    nnoremap <buffer> <leader>gs <plug>(lsp-status)

    autocmd! BufWritePre *.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_register_server
    au!
    " au User lsp_setup call lsp#register_server({
    " \ 'name': 'ruff-lsp',
    " \ 'cmd': {server_info->['ruff-lsp']},
    " \ 'allowlist': ['python'],
    " \ })
augroup END

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" vim-lsp-settings
" let g:lsp_settings_root_markers = [
" \   '.git/'
" \ ]
let g:lsp_settings_filetype_python = ['pylsp','ruff-lsp']
" }}}
" ale lint {{{
let g:ale_completion_enabled = 0
let g:ale_linters_explicit = 1
let g:ale_hover_cursor = 0

let g:ale_disable_lsp = 1

let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'

let g:ale_virtualtext_cursor = 'current'

augroup ale_filetyp
    au!
    autocmd FileType go let b:ale_linters = ['golangci-lint']
augroup END
" ale lint }}}
" vim-go {{{

" let g:go_fold_enable                     = 0
" let g:go_highlight_build_constraints     = 0
" let g:go_highlight_extra_types           = 0
" let g:go_highlight_fields                = 0
" let g:go_highlight_function_calls        = 0
" let g:go_highlight_functions             = 0
" let g:go_highlight_functions_parameters  = 0
" let g:go_highlight_operators             = 0
" let g:go_highlight_types                 = 0
" let g:go_highlight_variable_assignments  = 0
" let g:go_highlight_variable_declarations = 0
let g:go_auto_type_info                  = 0
let g:go_code_completion_enabled         = 0
let g:go_def_mapping_enabled             = 0
let g:go_doc_balloon                     = 0
let g:go_doc_keywordprg_enabled          = 0
let g:go_doc_popup_window                = 0
let g:go_fmt_autosave                    = 0
let g:go_gopls_enabled                   = 0
let g:go_imports_autosave                = 0
let g:go_mod_fmt_autosave                = 0
let g:go_template_autocreate             = 0
let g:go_term_enabled                    = 0
let g:go_textobj_enabled                 = 0

" }}}
" ultisnips {{{
let g:UltiSnipsExpandOrJumpTrigger = "<tab>"
let g:UltiSnipsEnableSnipMate = 0

" }}}
" fzf {{{

nnoremap <leader>ff :Files ~<CR>
nnoremap <leader>f. :Files ~/.config/<CR>
nnoremap <leader>fz :Files ~/.config/zsh/<CR>
nnoremap <leader>fv :Files ~/.vim/<CR>
nnoremap <leader>fp :Files $VIMRUNTIME<CR>

nnoremap <leader>f<space> :Files<Space>
nnoremap <leader>fd :Files<CR>

nnoremap <leader>fa :Tags<space>
nnoremap <leader>fA :BTags<space> 
nnoremap <leader>fg :GFiles<cr> " git status
nnoremap <leader>fG :GFiles?<cr> " git ls-files
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fH :History<CR>
nnoremap <leader>f: :History:<CR>
nnoremap <leader>f/ :History/<CR>
nnoremap <leader>fl :Lines<space>
nnoremap <leader>fL :BLines<space>
nnoremap <leader>fs :Snippets<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Changes<CR>
nnoremap <leader>fC :Commits<cr>
nnoremap <leader>fj :Jumps<CR>
nnoremap <leader>fk :Locate<space>
nnoremap <leader>fK :Colors<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>f' :Marks<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>ft :Filetypes<CR>
nnoremap <leader>fw :Windows<CR>

let g:fzf_layout = { 'down': '~50%' }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*,tags,.DS_Store" '

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
" }}}
" tagbar {{{
let g:tagbar_autofocus = 0
let g:tagbar_compact = 2
" This value can also be set using the |winwidth(0)| function call to calculate
" a dynamic value to make the tagbar width relative to a percentage of the vim
" window size as seen in the example below that will open the tagbar window to
" 20 percent of the window width with a limit of no less than 25 characters.
let g:tagbar_width = max([25, winwidth(0) / 5])
nm <silent> <leader>a :TagbarToggle<CR>
" https://github.com/jstemmer/gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

autocmd! BufWritePost *.go silent! !gotags -R -f tags . 2>&1 &

" }}}
" emmet-vim {{{
let g:user_emmet_leader_key = '<C-y>'
let g:user_emmet_install_global = 0
autocmd! FileType html,css,gohtmltmpl EmmetInstall
" }}}
" python-syntax {{{
let g:python_highlight_builtins = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_templates = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_operators = 1

" python-syntax }}}
" debug vimspector {{{
let g:vimspector_bottombar_height = 5

" nnoremap gsl :call vimspector#Launch()<cr>
" nnoremap gsL :call vimspector#Reset()<cr>
" nnoremap gsB <Plug>VimspectorBreakpoints
" nnoremap gsw :VimspectorWatch<space>
" nnoremap gsE :call vimspector#ClearBreakpoints()<cr>
" nnoremap gsD <Plug>VimspectorDisassemble
" nnoremap gsp <Plug>VimspectorPause
" nnoremap gsR <Plug>VimspectorRestart
" nnoremap gsx <Plug>VimspectorStop
" nnoremap gsK <Plug>VimspectorBalloonEval
" nnoremap gsb <Plug>VimspectorToggleBreakpoint
" nnoremap gst <Plug>VimspectorToggleConditionalBreakpoint
" nnoremap gsf <Plug>VimspectorAddFunctionBreakpoint
" nnoremap gsc <Plug>VimspectorContinue
" nnoremap gs<space> <Plug>VimspectorStepInto
" nnoremap [s <Plug>VimspectorStepOut
" nnoremap ]s <Plug>VimspectorStepOver
" nnoremap gsu <Plug>VimspectorUpFrame
" nnoremap gsd <Plug>VimspectorDownFrame
" nnoremap gsh <Plug>VimspectorRunToCursor
" debug vimspector }}}

" IDE }}}
" vim-xkbswitch {{{
" Must Use Input Source Switcher.
if has("mac")
    let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
    let g:XkbSwitchEnabled = 1
    let g:airline_detect_iminsert = 1
endif
" }}}
" vim-sneak {{{
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
hi Sneak guifg=fg guibg='#00aa00'
hi SneakScope guifg=fg guibg='#00aa00'
hi SneakLabel gui=bold guifg=fg guibg='#6219FF'
hi SneakLabelMask guifg='#6219FF' guibg='#6219FF'
" }}}
" vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
nnoremap gA ga
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {  '\': { 'pattern': '\\',      'left_margin':   1,      'right_margin':  1,      'stick_to_left': 0    } }
" }}}
" vim-sandwich surround {{{
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

nnoremap <leader>sa <Plug>(sandwich-add)
xnoremap <leader>sa <Plug>(sandwich-add)
onoremap <leader>sa <Plug>(sandwich-add)

nnoremap <leader>sd <Plug>(sandwich-delete)
xnoremap <leader>sd <Plug>(sandwich-delete)
nnoremap <leader>ss <Plug>(sandwich-delete-auto)

nnoremap <leader>sr <Plug>(sandwich-replace)
xnoremap <leader>sr <Plug>(sandwich-replace)
nnoremap <leader>sR <Plug>(sandwich-replace-auto)

" }}}
" goyo {{{
nnoremap <silent> <leader>gy :Goyo<CR>
" }}}
" choosewin {{{
nmap - <Plug>(choosewin)
" if you want to use overlay feature
let g:choosewin_overlay_enable = 1
let g:choosewin_statusline_replace = 0
" choosewin }}}
" Plugin Configs }}}
