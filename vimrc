execute pathogen#infect()
call plug#begin($HOME.'/.vim/plugged')
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'junegunn/fzf.vim'
	Plug 'neomake/neomake'
	Plug 'adoy/vim-php-refactoring-toolbox'
	Plug 'tobyS/pdv'
call plug#end()
" Setup neomake

colorscheme molokai

filetype plugin indent on

if has('autocmd')
    filetype plugin indent on
		"autocmd BufEnter * lcd %:p:h
endif

if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif
" All sets here
set laststatus=2
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif
set wildmenu
set path+=**
set autoindent
set autoread
set backspace=indent,eol,start
set complete-=i
set confirm
set encoding=utf-8
set foldcolumn=3 
set fileformats=unix,dos,mac
set guifont=Liberation\ Mono\ Regular\ 18
set hidden
set ignorecase
set lazyredraw
set matchtime=2
set matchpairs+=<:>
set numberwidth=5
set number
set noswapfile
set nowritebackup
set nobackup
set nocompatible
set ruler
set showcmd
set showmode
set showmatch
set smarttab
set smartcase
set smartindent
set tabstop=2 shiftwidth=2 
set expandtab
set softtabstop=2
set statusline=%2*\  
set statusline+=%1*\ b:%n\ 
set statusline+=%2*%40f\ 
set statusline+=[%l/%L/%c]\ 
set statusline+=%3*\ %{fugitive#statusline()}\ 
set statusline+=%=
set statusline+=%2*\ ‹‹\ %{strftime('%R',getftime(expand('%')))}\ ››
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

" Status line stuff
hi User1 guifg=#FFFFFF guibg=#191f26 gui=BOLD
hi User2 guifg=#000000 guibg=#959ca6
hi User3 guifg=#000000 guibg=#4cbf99
" End of sets

hi! link FoldColumn Normal

if has('mouse')
    set mouse=a
endif

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn','\%81v',100)
filetype plugin on
