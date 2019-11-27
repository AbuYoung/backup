call plug#begin('~/.config/nvim/plugged')

Plug 'ncm2/ncm2'
" v2 of the nvim-completion-manager.
Plug 'roxma/nvim-yarp'
" LanguageServer client for NeoVim.
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-path'
Plug 'ObserverOfTime/ncm2-jc2', {'for': ['java', 'jsp']}
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java', 'jsp']}
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-jedi'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
"Plug 'Yggdroot/indentLine' 会导致js下，冒号隐藏
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'jrosiek/vim-mark'
Plug 'bigeagle/molokai'
Plug 'majutsushi/tagbar'
Plug 'cespare/vim-toml'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'

call plug#end()

set shell=/bin/sh

if !exists("g:vimrc_loaded")
    colorscheme molokai
    let g:molokai_original = 1
    if has("gui_running")
        set guioptions-=T "隐藏工具栏
        set guioptions-=L
        set guioptions-=r
        set guioptions-=m
        set gfn=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold\ 10
        set gfw=STHeiti\ 9
        set langmenu=en_US
        set linespace=0
    endif " has
endif " exists(...)

set clipboard=unnamed

set so=15
filetype on
filetype plugin on
filetype indent on
set nu
syntax on

set list lcs=tab:\¦\

if has("autocmd")
	autocmd BufReadPost *
		 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
		 \exe "normal g'\"" |
		 \endif
endif

"set completeopt=longest,menu

if has('mouse')
	set mouse=a
	set selectmode=mouse,key
	set nomousehide
endif

set autoindent
set modeline
set cursorline

set shiftwidth=4
set tabstop=4
set softtabstop=4

set showmatch
set matchtime=0
set nobackup
set nowritebackup

if has('nvim')
	set ttimeout
	set ttimeoutlen=0
endif

set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set enc=utf-8

set foldmethod=syntax
set foldcolumn=0
set foldlevel=100
nnoremap <space> @=((foldclosed(line(',')) < 0) ? 'zc' : 'zo')<CR>
"空格键代替zc进行折叠，zo进行打开

set smartcase
set ignorecase
set nohlsearch
set autochdir

vmap j gj
vmap k gk
nmap j gj
nmap k gk

nmap T :tabnew<CR>

"Python
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'

"NerdTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"ncm2
" Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

" ncm2-pyclang
let g:ncm2_pyclang#library_path = '/usr/lib64/libclang.so.9'
" a list of relative paths for compile_commands.json
let g:ncm2_pyclang#database_path = [
            \ 'compile_commands.json',
            \ 'build/compile_commands.json'
            \ ]
" a list of relative paths looking for .clang_complete
let g:ncm2_pyclang#args_file_path = ['.clang_complete']
" Goto Declaration
autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>
let g:ncm2_pyclang#gcc_path = '/usr/bin/gcc'

"javascript-typescript-langserver
let g:LanguageClient_serverCommands = {
  \ 'typescript': ['javascript-typescript-stdio']
  \ }

"Java Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

"Jedi
let g:ncm2_jedi#python_version 

