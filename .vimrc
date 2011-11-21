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
set undodir=~/.vim/tmp/undo//
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

" intuitive backspacing in insert mode
set backspace=indent,eol,start

" show command being typed
set showcmd

" limit line length for more readability
set textwidth=85

" after typing a bracket show match
set showmatch

" theme
colorscheme dusk 

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

" Plugin Settings 

" PHP Doc 
" http://www.vim.org/scripts/script.php?script_id=1355
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 
