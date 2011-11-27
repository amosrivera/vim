" .vimrc
" Author: @amosrivera

set encoding=utf-8

" automatic indentation
set smartindent
set autoindent

" width of the tab
set tabstop=4

" affects what happends when pessing >>,<< or == 
" it also affects automatic indentation
set shiftwidth=4

" ignore vi compatibility
set nocompatible

" set backups dir
" set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup

" remove toolbar
set guioptions-=T  

" remove menu bar
" set guioptions-=m  

" set working dir to the current file
set autochdir

" show line numbers
set number

" case insensitive search
set ignorecase

" highlight search matches
set hlsearch

" start searching once you type the first character
set incsearch

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show command being typed
set showcmd

" limit line length for more readability
set textwidth=85

" after typing a bracket show match
set showmatch

" highlight whitespaces
" set list
set listchars=tab:→\ ,eol:↩
nmap <silent><leader>s :set list!<CR>

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" makes ; to : so tu run a command just ;w - faster
nnoremap ; :

" change the map leader from \ to ,
let mapleader=","

" quickly edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" theme
" colorscheme cloudsmidnight
" colorscheme dusk
" colorscheme mustang
colorscheme molokai

" undo in insert mode.
imap <c-z> <c-o>u

" browser-like tab navigation 
nmap <C-S-tab> :tabprevious<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
map <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-tab> :tabnext<CR>
imap <C-tab> <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
map <C-F4> <Esc>:tabclose<CR>

" select all width Ctrl-A
nnoremap <C-A> ggvG<S-V><CR>

" w!! becomes sudo vim
cmap w!! %!sudo tee > /dev/null %

" resize splits when the window is resized - super useful

au VimResized * exe "normal! \<c-w>="

" php doc plug in maping
" http://www.vim.org/scripts/script.php?script_id=1355
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR>

" call pathogen plug in
" https://github.com/tpope/vim-pathogen 
call pathogen#infect()
syntax on " turn on syntax highlighting
filetype plugin indent on  


