call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/indentLine'
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'jrosiek/vim-mark'
Plug 'bigeagle/molokai'
Plug 'majutsushi/tagbar'
Plug 'cespare/vim-toml'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'fatih/vim-go'
"Plug 'lervag/vim-latex'"
"Plug 'kchmck/vim-coffee-script'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

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

set completeopt=longest,menu

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
set nohlsearch
set autochdir

vmap j gj
vmap k gk
nmap j gj
nmap k gk

nmap T :tabnew<CR>


"YouCompleteMe
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:python3_host_prog='/usr/bin/python3'
"let g:ycm_server_python_interpreter='~/miniconda3/envs/test/bin/python3.6'
let g:ycm_global_ycm_extra_conf='~/.config/nvim/.ycm_extra_conf.py'

"NerdTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"Rainbow_parenthese
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" coc.nvim
set hidden " if hidden is not set, TextEdit might fall

set cmdheight=2 " Better display for message

set updatetime=300 " You will have the bad experience for diagnostic message when it's default 4000

set signcolumn=yes " always show signcolumns

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction<Paste>

