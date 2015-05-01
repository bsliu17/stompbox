"" Some general configuration stuff
" use :help to figure out what this stuff does

" pathogen support
execute pathogen#infect()
syntax on
filetype plugin indent on

" vim, not vi
set nocompatible

" detect filetypes
filetype on

" Display stuff - show hidden chars, set colors, and
" show hidden characters, like EOL and whitespace
set list
colorscheme elflord
set listchars=tab:»\ ,trail:.

" In normal mode, I swap : with ; and vice versa
" to save keystrokes
noremap ; :
noremap : ;

" line numbers 
set nu

" status bar stuff
set ruler
set showcmd
set showmode
set laststatus=2

" performance optimizations
set lazyredraw
set ttyfast

" searching options
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch

" remap tp and tn for tab switching
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>

" 5 lines between top/bottom before scrolling
set scrolloff=5

" tab completion stuff
set wildmode=longest,full
set wildignore=*.o,*~,*.pyc,*.d
set wildmenu

" allows backspacing beyond insert point, indents, and line breaks
set backspace=indent,eol,start

"" Limit to 80 chars
set colorcolumn=80

"" Python specific configs
autocmd Filetype python set tabstop=8
autocmd Filetype python set expandtab
autocmd Filetype python set shiftwidth=4
autocmd Filetype python set softtabstop=4

"" C/CPP specific configs
autocmd Filetype c,cpp set tabstop=8
autocmd Filetype c,cpp set shiftwidth=8
autocmd Filetype c,cpp set noexpandtab

"" Web specific configs, specifically for node.js
autocmd Filetype javascript,html,css set autoindent
autocmd Filetype javascript,html,css set copyindent
autocmd Filetype javascript,html,css set smartindent

autocmd Filetype javascript,html,css set tabstop=2
autocmd Filetype javascript,html,css set shiftwidth=2
autocmd Filetype javascript,html,css set softtabstop=2
autocmd Filetype javascript,html,css set expandtab
autocmd Filetype javascript,html,css set textwidth=80
