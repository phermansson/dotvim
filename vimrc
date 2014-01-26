"call pathogen#infect()

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle addons
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'https://github.com/scrooloose/syntastic'
Bundle 'ccase.vim'
"Bundle 'Rip-Rip/clang_complete'
Bundle 'ttcn-syntax'
Bundle 'ttcn-indent'
Bundle 'ttcn-dict'
Bundle 'ttcn-ftplugin'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'bash-support.vim'
Bundle 'a.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'Twinside/vim-codeoverview'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Syntastic'

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

" == Python mode starts here == 
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
" == Python mode ends here

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

" YCM
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_invoke_completion = '<C-@>'

" syntastic
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_auto_jump=0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Ctags function stack
nmap <M-h> <C-T>
nmap <M-l> <C-]>
