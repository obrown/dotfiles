" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1024

" don't redraw in macros
set lazyredraw

" Enable filetype plugins
filetype plugin on
filetype indent on

" Better mouse copying
set mouse=a

" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line number
set number

" Highlight current line
set cursorline

" Highlight matching brackets
set showmatch

" Auto complete help for command
set wildmenu

" Show last entered command
set showcmd

" Show row, col in bar
set ruler

" Ignore case when searching
set ignorecase

" Makes search act like search in modern browsers
set incsearch

" Don't beep
set novisualbell
set noerrorbells

" Complete with longest common prefix, always show menu
set completeopt=menuone,longest

" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark

colorscheme gruvbox

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Save undos after file closes
set undodir=$HOME/.vim/undo
set undofile

" Set to auto read when a file is changed from the outside
set autoread

" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 2 spaces per tab
set shiftwidth=2 tabstop=2 softtabstop=2

" Mark the 120th column
set colorcolumn=120

" More normal regexs
set magic

" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map leader to space
let mapleader = "\<Space>"

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ Col:\ %c

" find ctag file between here and home directory
set tags+=tags;$HOME

"  Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

function! TogglePaste()
  if(&paste == 1)
    set nopaste
  else
    set paste
  endif
endfunc

function! ToggleRelativeNumbers()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

function! ToggleShowWhitespace()
  if(&list == 1)
    set nolist
  else
    set list
    set listchars=tab:▸\ ,eol:¬,trail:.
  endif
endfunc

function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" Plugin options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.o']

" gVim options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions+=c
set guioptions+=R
set guioptions-=m
set guioptions-=r
set guioptions-=b
set guioptions-=T
set guioptions-=R
set guioptions-=L
set guioptions-=e

" Key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <Leader>hm :call ToggleHex()<CR>
nnoremap <silent> <Leader>pm :call TogglePaste()<CR>
nnoremap <silent> <Leader>rn :call ToggleRelativeNumbers()<CR>
nnoremap <silent> <Leader>ws :call ToggleShowWhitespace()<CR>
nnoremap <silent> <Leader>s :mksession!<CR>

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" avoid accidently entering Ex mode
nnoremap Q <nop>
