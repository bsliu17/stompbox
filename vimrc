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

" Show hidden characters, like EOL and whitespace
set list
set listchars=trail:.

" tab completion stuff
set wildmode=longest,full
set wildignore=*.o,*~,*.pyc,*.d
set wildmenu

"" Limit 80 chars 
set colorcolumn=80

"" C/CPP specific configs
autocmd Filetype c,cpp set tabstop=8
autocmd Filetype c,cpp set shiftwidth=8
autocmd Filetype c,cpp set noexpandtab
autocmd Filetype c,cpp colorscheme elflord

"" Javascript specific configs, specifically for node.js
autocmd Filetype javascript set autoindent
autocmd Filetype javascript set copyindent
autocmd Filetype javascript set smartindent

autocmd Filetype javascript set tabstop=2
autocmd Filetype javascript set shiftwidth=2
autocmd Filetype javascript set softtabstop=2
autocmd Filetype javascript set expandtab
autocmd Filetype javascript set textwidth=80
