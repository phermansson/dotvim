"call pathogen#infect()

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle "derekwyatt/vim-scala"
Bundle "altercation/vim-colors-solarized"
Bundle "https://github.com/scrooloose/syntastic"
Bundle "ccase.vim"
Bundle "Rip-Rip/clang_complete"
Bundle "ttcn-syntax"
Bundle "ttcn-indent"
Bundle "ttcn-dict"
Bundle "ttcn-ftplugin"
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'

" syntax highlighting
syntax on
syntax sync fromstart

" Filetypes
filetype indent on
filetype plugin on
filetype plugin indent on

" setup Powerline
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" Map nerdtree to f2
map <F2> :NERDTreeToggle<CR>

" Python-mode
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
"set number
set scrolloff=4
set hlsearch

" Make the backspace key behave normally
set backspace=indent,eol,start

" Use the below highlight group when displaying bad whitespace.
highlight BadWhitespace ctermbg=red guibg=red

set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized


au BufRead,BufNewFile * match BadWhitespace /\s\+$/
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw 2match BadWhitespace /^\t\+/
