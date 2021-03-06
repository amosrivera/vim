" .vimrc
" Author: @amosrivera

set encoding=utf-8

" automatic indentation
set smartindent
set autoindent

" show cursor at all times
set ruler 

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
set textwidth=100

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

"Split windows below the current window.  
set splitbelow

" turn on syntax highlighting
syntax on 

" makes ; to : so tu run a command just ;w - faster
nnoremap ; :

" change the map leader from \ to ,
let mapleader=","

"Ever notice a slight lag after typing the leader key + command? This lowers  
"the timeout.  
set timeoutlen=500

" quickly edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" theme and colors
set background=dark
if has('gui_running') " if in gvim
	colorscheme molokai
else
	colorscheme desert
endif

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
filetype plugin indent on  

" tabularize plug in goodness
" function to align the characters every time the delimiter is typed
" https://gist.github.com/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" nerdtree plugin mappings 
" closes upon file selection
nnoremap <Leader>d :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>

" persistent 
nnoremap <Leader>D :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>
