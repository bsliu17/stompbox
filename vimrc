" Turn off vi compatibility
"set nocompatible

" Some Linux-kernel related stuff
filetype plugin indent on
syn on se title
set tabstop=8
set shiftwidth=8
set noexpandtab

" In normal mode, I remap : to ; so I don't have to hold down shift to
" enter a command like ':e' or ':sort'. Does not affect insert mode.
noremap ; :
noremap : ;

" I like line numbers.
set nu

" This adds some useful line and column info to the status bar.
set ruler
 
" Options to modify searching.
set wrapscan
set ignorecase
set smartcase " search is case insensitive unless the search term contains a
" capital letter.
set hlsearch " highlight everything that matches the search term.
set incsearch " incremental search, start matching immediately.
"set magic " always match the search term as regex.
 
" Always display the status bar.
set laststatus=2
set showcmd
set showmode
 
" Useful menu for tab completeing commands, filenames, in the status br.
" Enter ':e ~/' in normal mode, then hit tab for an example.
set wildmode=longest,full
set wildignore=*.o,*~,*.pyc,*.d
set wildmenu
 
" buffer interaction
set lazyredraw
set mouse=a

" Keep a 5 line buffer between the cursor and the top and bottom of the window
set scrolloff=5

" Highlight the line the cursor is on
set cursorline
 
" hidden character display
set list
" show spaces at the end of a line as '.', and hard tabs as » .
set listchars=tab:»\ ,trail:.

" set colorcolumn to 80 chars
set colorcolumn=80

" Use elflord scheme for C and CPP files
autocmd Filetype c,cpp colorscheme elflord

" make searching highlight all results in a file 
set hlsearch

"navigate between tabs faster than typing \":tabnext"
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
