
" This must be first, because it changes other options as a side effect.
set nocompatible

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/](bower_components|node_modules)$'

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set nowritebackup

set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

command W w !sudo tee % > /dev/null

exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set autoindent

set incsearch
set hlsearch


set number

colorscheme desert
set cursorline
augroup CursorLine
    autocmd!
    autocmd VimEnter * highlight CursorLine cterm=NONE ctermbg=DarkBlue
augroup END

set autoread


map <F3> :w<CR>:!python %<CR>
map <F4> :w<CR>:!sh %<CR>

map <F2> :read !date +\%H:\%M<CR>A 
map <F6> :read !date +\%Y-\%m-\%d<CR>A 

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

inoremap jk <ESC>

let mapleader = "\<Space>"


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType markdown setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
