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
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle "bash-support.vim"
Bundle "taglist.vim"
Bundle "ctags.vim"
Bundle 'bash-support.vim'
Bundle 'a.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'Twinside/vim-codeoverview'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'Syntastic'
Bundle 'bling/vim-airline'
Bundle 'jistr/vim-nerdtree-tabs'
:set tags=./tags;~/Projects

set completeopt=menu

" syntax highlighting
syntax on
syntax sync fromstart

" Filetypes
filetype indent on
filetype plugin on
filetype plugin indent on

set tags=./tags,tags;
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_use_library = 1
let g:clang_library_path = "/home/eherpat/packages/llvm-3.2/lib/"
nnoremap t <C-]>
nnoremap <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth = 40
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1

" setup Powerline
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" Map nerdtree to f2
map <F2> :NERDTreeToggle<CR>
"let NERDTreeMapOpenInTab='<ENTER>'
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

nmap <silent> <c-x>c :execute "!ctags -R --fields=+l "
nmap <silent> <c-x>s :execute "cscope -r"

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

" Improve drawing speed
set lazyredraw
set ttyfast

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
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" syntastic
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_auto_jump=0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Ctags function stack
nmap <c-n> <C-T>
nmap <c-m> <C-]>

"cscope options
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
