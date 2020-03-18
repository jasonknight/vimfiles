execute pathogen#infect()
call plug#begin($HOME.'/vimfiles/plugged')
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
set guifont=Liberation\ Mono\ Bold:h18
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
set smartcase
set smartindent
set statusline=%2*\  
set statusline+=%1*\ b:%n\ 
set statusline+=%2*%40f\ 
set statusline+=[%l/%L/%c]\ 
set statusline+=%3*\ %{fugitive#statusline()}\ 
set statusline+=%=
set statusline+=%2*\ ‹‹\ %{strftime('%R',getftime(expand('%')))}\ ››
set tabstop=2 shiftwidth=2 
" End of sets

hi! link FoldColumn Normal

if has('mouse')
endif

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn','\%81v',100)
" From the talk watch?v=XA2WjJbmmoM How to do 90% of what plugins do with just
" vim
" My WOW moment
" This like: %g/^set/m'a
" So epic, so so epic
filetype plugin on
" Search down into subfolders
" Provides tab-completion for all file-related tasks
" Display all matching files when we tab complete
" Now you can use :b <part of name> to switch buffers
" and you can use :find *.cpp or etc to pull up the
" wildmenu and traverse it with tab and shift-tab

" -- CTags Support, be sure to download ctags https://github.com/universal-ctags/ctags

command! MakeTags !ctags -R
autocmd! BufWritePost *.cpp,*.c,*.h,*.hpp silent! !start /b ctags -R
" You can go to defs with ctrl+] and return to your place with ctrl+t

" FILE BROWSING
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

" Status line stuff
hi User1 guifg=#FFFFFF guibg=#191f26 gui=BOLD
hi User2 guifg=#000000 guibg=#959ca6
hi User3 guifg=#000000 guibg=#4cbf99

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = shellescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap number
  " call setline(1, 'You entered:    ' . a:cmdline)
  " call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  silent execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

command! -complete=file -nargs=* Test call s:RunShellCommand('php tests/test.php'.<q-args>)
command! -complete=file -nargs=* Php call s:RunShellCommand('php '.<q-args>)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

