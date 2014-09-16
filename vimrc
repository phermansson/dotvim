"call pathogen#infect()

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle addons
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'desert-warm-256'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'https://github.com/scrooloose/syntastic'
Bundle 'ccase.vim'
Bundle 'ttcn-syntax'
Bundle 'ttcn-indent'
Bundle 'ttcn-dict'
Bundle 'ttcn-ftplugin'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle "taglist.vim"
Bundle "ctags.vim"
Bundle 'bash-support.vim'
Bundle 'a.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'Twinside/vim-codeoverview'
Bundle 'nvie/vim-flake8'
Bundle 'ervandew/supertab'
Bundle 'davidhalter/jedi-vim'
Bundle 'vim-scripts/csv.vim'
Bundle 'kien/ctrlp.vim'
:set tags=./tags;~/Projects

" == Vim general settings
set tags=./tags;~/Projects
set completeopt=menu
" syntax highlighting
syntax on
syntax sync fromstart
" Filetypes
filetype indent on
filetype plugin on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set number
set scrolloff=4
set hlsearch
" Make the backspace key behave normally
set backspace=indent,eol,start
" Use the below highlight group when displaying bad whitespace.
highlight BadWhitespace ctermbg=red guibg=red
set background=dark
colorscheme Tomorrow-Night
" Improve drawing speed
set lazyredraw
set ttyfast
au BufRead,BufNewFile * match BadWhitespace /\s\+$/
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw 2match BadWhitespace /^\t\+/

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" show trailing white space
set list
set listchars=tab:→→,extends:>,precedes:<

" == Python mode
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
let g:pymode_breakpoint_key = 'b'
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

" == NerdTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'

" == Ctags
map <silent> <c-x>c :execute "!ctags -R --fields=+l "
nmap <silent> <c-x>s :execute "cscope -r"
" Change function stack key mapping
nmap <c-n> <C-T>
nmap <c-m> <C-]>

" ==Cscope options
if has("cscope")
        set csto=0                      " First search cscope database, then ctag file
        set cst                         " Always use cscope instead of ctag
        set nocsverb                    " Don't be verbose
        if filereadable("cscope.out")
                cs add cscope.out
        elseif $CSCOPE_DB != ""
                cs add $CSCOPE_DB
        endif
        set csverb
        nmap <C-c>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-c>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-c>d :cs find d <C-R>=expand("<cword>")<CR><CR>
        " Opens the tag in a new window on the right
        nmap <C-c>S :rightb vert scs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>G :rightb vert scs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>C :rightb vert scs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>T :rightb vert scs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>E :rightb vert scs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-c>F :rightb vert scs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-c>I :rightb vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-c>D :rightb vert scs find d <C-R>=expand("<cword>")<CR><CR>
 endif

 " == Airline
set laststatus=2
let g:airline_powerline_fonts = 1
