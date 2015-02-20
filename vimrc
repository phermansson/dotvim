
""" Setup-neo-bundle -----------------------------------------------------------
let neoBundleReadMe=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neoBundleReadMe)
  echo "Fetch and install NeoBundle...\n"
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
endif

if has('vim_starting')
  set nocompatible " Be iMproved
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
  let g:make = 'make'
endif

""" Bundles --------------------------------------------------------------------
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim',
  \ {
  \ 'build': {
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'hewes/unite-gtags'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'freitass/todo.txt-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'terryma/vim-multiple-cursors'

NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'gcmt/wildfire.vim'

NeoBundle 'chriskempson/tomorrow-theme'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'bling/vim-airline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'minibufexpl.vim'

"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite-outline'

NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'int3/vim-extradite'

NeoBundle "davidhalter/jedi-vim"
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'
""" neo-bundle-settings --------------------------------------------------------
call neobundle#end()
" Required:
filetype plugin indent on
NeoBundleCheck
let mapleader = ","

""" airline --------------------------------------------------------------------
set laststatus=2
let g:airline_powerline_fonts = 1

""" MiniBufExplorer ------------------------------------------------------------
nnoremap <silent> <F3> :TMiniBufExplorer<CR>
"let g:miniBufExplMapCTabSwitchBuffs = 1
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplModSelTarget = 0
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1

let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1

""" Unite ----------------------------------------------------------------------
nnoremap [unite] <Nop>
nmap <Leader><Leader> [unite]

"call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('files', 'filters', ['sorter_rank'])

" Start insert mode in unite-action buffer.
"call unite#custom#profile('action', 'context', {
"  \ 'start_insert' : 1,
"  \ 'smartcase' : 1
"\ })

nnoremap [unite]f :<C-u>Unite -start-insert file_rec/async:!<CR>

" Unite: unite-source-history/yank
let g:unite_source_history_yank_enable = 1
nnoremap [unite]y :<C-u>Unite history/yank<CR>

" Unite: neosnippet-unite-source-neosnippet
nnoremap [unite]s :<C-u>Unite neosnippet<CR>

" Unite: unite-source-grep
let g:unite_source_grep_max_candidates = 200
if executable('ag')

" Use ag in unite grep source.
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
\ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
\ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')

" Use pt in unite grep source.
" https://github.com/monochromegane/the_platinum_searcher
let g:unite_source_grep_command = 'pt'
let g:unite_source_grep_default_opts = '-i --nogroup --nocolor'
let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')

" Use ack in unite grep source.
let g:unite_source_grep_command = 'ack-grep'
let g:unite_source_grep_default_opts =
\ '-i --no-heading --no-color -k -H'
let g:unite_source_grep_recursive_opt = ''
endif

nnoremap [unite]ug :<C-u>Unite grep:.:-iIR:<CR>
" Unite-gtags
" let g:unite_source_gtags_project_config = {
" \ '_': { 'treelize': 1 }
" \ }
" specify your project path as key.
" '_' in key means default configuration.
nnoremap [unite]gx :<C-u>Unite gtags/context<CR>
nnoremap [unite]gr :<C-u>Unite gtags/ref<CR>
nnoremap [unite]gd :<C-u>Unite gtags/def<CR>
nnoremap [unite]gg :<C-u>Unite gtags/grep<CR>
nnoremap [unite]gc :<C-u>Unite gtags/completion<CR>

nnoremap [unite]gX :<C-u>Unite gtags/context:
nnoremap [unite]gR :<C-u>Unite gtags/ref:
nnoremap [unite]gD :<C-u>Unite gtags/def:
nnoremap [unite]gG :<C-u>Unite gtags/grep:
nnoremap [unite]gC :<C-u>Unite gtags/completion:

nnoremap [unite]gs :GtagsCursor<CR>

map [unite]t :!~/packages/dotvim/make_tags<cr>:Unite -no-split -auto-preview -start-insert tag<cr>

""" NerdCommenter --------------------------------------------------------------
" Map <C-/> to toggle comment both in normal and visual mode
nmap  <plug>NERDCommenterToggle
vmap  <plug>NERDCommenterToggle

""" Easytags -------------------------------------------------------------------
let g:easytags_cmd = "gtags"
let g:easytags_dynamic_files = 1
let g:easytags_async = 1

""" Tabularize -----------------------------------------------------------------
nmap <silent> <leader>a= :<C-u>Tabularize /=<CR>
vmap <silent> <leader>a= :<C-u>Tabularize /=<CR>
nmap <silent> <leader>a: :<C-u>Tabularize /:<CR>
vmap <silent> <leader>a: :<C-u>Tabularize /:<CR>
nmap <silent> <leader>a:: :<C-u>Tabularize /:\zs<CR>
vmap <silent> <leader>a:: :<C-u>Tabularize /:\zs<CR>
nmap <silent> <leader>a, :<C-u>Tabularize /,<CR>
vmap <silent> <leader>a, :<C-u>Tabularize /,<CR>

""" NerdTree -------------------------------------------------------------------
nnoremap <silent> <F2> :NERDTreeToggle<CR>
":let NERDTreeQuitOnOpen = 1
""" Tagbar ---------------------------------------------------------------------
let g:tagbar_sort = 0 " Display tags the same order they appear in the source file
let g:tagbar_width = 30 " Set Tagbar window width to 30
let g:tagbar_autofocus = 1 " Change the focus to the Tagbar window whenever it is opened
nnoremap <silent> <F9> :TagbarToggle<CR>

""" Fugitive -------------------------------------------------------------------
set diffopt=filler,vertical
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gp :Git push<CR>
nmap <silent> <leader>gs :Gstatus<CR>

""" a.vim ----------------------------------------------------------------------
map <silent> <C-Tab> :A<CR>
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal g`\"" |
\ endif

""" Gtags-find -----------------------------------------------------------------
let search_max = 20
if exists("$GTAGSGLOBAL") || exists(":global")
  if exists("vimrc_debug") && vimrc_debug == 1
    echo "Searching GPATH, GTAGS, and GRTAGS ..."
  endif
  let s:dir = fnamemodify(getcwd(), ":p:h")
  let i = 1
  while i <= search_max
    if exists("vimrc_debug") && vimrc_debug == 1
      echo s:dir
    endif
    if filereadable(s:dir . "/GPATH") && filereadable(s:dir . "/GTAGS") && filereadable(s:dir . "/GRTAGS")
      let $GTAGSROOT = s:dir
      let GtagsCscope_Auto_Load = 1
      break
    elseif s:dir == '/'
      break
    else
      let s:dir = fnamemodify(s:dir, ":h")
      let i += 1
    endif
  endwhile
endif

""" Cscope-settings ------------------------------------------------------------
 if filereadable("GTAGS")
     set csprg=gtags-cscope
     cs add GTAGS
 elseif filereadable("cscope.out")
     cs add cscope.out
     "else add the database pointed to by environment variable
 elseif $CSCOPE_DB !=""
     cs add $CSCOPE_DB
 endif

 set csto=0
 set cscopeverbose
 " key mapping
 map <S-F11> <ESC>:cs add cscope.out<CR>
 map <C-F11> <ESC>:cscope find
 " 's' symbol: find all references to the token under cursor
 " 'g' global: find global definition(s) of the token under cursor
 " 'c' calls: find all calls to the function name under cursor
 " 't' text: find all instances of the text under cursor
 " 'e' egrep: egrep search for the word under cursor
 " 'f' file: open the filename under cursor
 " 'i' includes: find files that include the filename under cursor
 " 'd' called: find functions that function under cursor calls
 map <F3>s <ESC>:cs find s <C-R>=expand("<cword>")<CR><CR>
 map <F3>g <ESC>:cs find g <C-R>=expand("<cword>")<CR><CR>
 map <F3>c <ESC>:cs find c <C-R>=expand("<cword>")<CR><CR>
 map <F3>t <ESC>:cs find t <C-R>=expand("<cword>")<CR><CR>
 map <F3>e <ESC>:cs find e <C-R>=expand("<cword>")<CR><CR>
 map <F3>f <ESC>:cs find f <C-R>=expand("<cfile>")<CR><CR>
 map <F3>i <ESC>:cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
 map <F3>d <ESC>:cs find d <C-R>=expand("<cword>")<CR><CR>
 " split way
 nmap <C-F3>s :scs find s <C-R>=expand("<cword>")<CR><CR>
 nmap <C-F3>g :scs find g <C-R>=expand("<cword>")<CR><CR>
 nmap <C-F3>c :scs find c <C-R>=expand("<cword>")<CR><CR>
 nmap <C-F3>t :scs find t <C-R>=expand("<cword>")<CR><CR>
 nmap <C-F3>e :scs find e <C-R>=expand("<cword>")<CR><CR>
 nmap <C-F3>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
 nmap <C-F3>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
 nmap <C-F3>d :scs find d <C-R>=expand("<cword>")<CR><CR>
 " vsplit way
 nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
 nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
 nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
 nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
 nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
 nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
 nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
 nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

""" Basic-keybindings  --------------------------------------------------------
command Bd bp | sp | bn | bd

nmap <Leader>n  :MBEbp<CR>
nmap <Leader>m  :MBEbn<CR>
nmap <Leader>d  :Bd<CR>
nmap <Leader>f  :b

map <leader>tn :tabnew %<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

""" Appearance ----------------------------------------------------------------
syntax on
set encoding=utf8
set hlsearch
if has("gui_macvim")
set guifont=Menlo:h12
endif

""" Color-scheme --------------------------------------------------------------
if $COLORTERM == 'gnome-terminal'
set t_Co=256
endif
set background=dark
colorscheme Tomorrow-Night

""" Basic-settings ------------------------------------------------------------
set backspace=indent,eol,start
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set nobackup " Disable the creation of backup files (the ones ending with ~)
set mouse=a " enable mouse 'all'
set number " line numbers
set scrolloff=1 " Keep the cursor away from top/bottom
set wildmode=longest,list " TAB completion (such as bash)
set laststatus=2 " Always show a status bar
set smartcase " Ignore case when search pattern is all lowercase
set shiftwidth=4 " # of spaces of auto indent
set softtabstop=4 " # of spaces of <TAB> key
set tabstop=4 " # of spaces erased when deleting a <TAB>
set expandtab " Insert spaces instead of tabs
set smarttab " 'siftwidth' in front of a line

""" Vim-Indent-Guides ---------------------------------------------------------
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
highlight IndentGuidesOdd ctermbg=236 guibg=#3a3a3a
highlight IndentGuidesEven ctermbg=236 guibg=#3a3a3a
au VimEnter * :IndentGuidesEnable

""" Vim-Rainbow-Parentheses ---------------------------------------------------
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""" fugitive shortcuts -------------------------------------------------------
noremap <Leader>gs :Gstatus<cr>
noremap <Leader>gc :Gcommit<cr>
noremap <Leader>ga :Gwrite<cr>
noremap <Leader>gl :Glog<cr>
noremap <Leader>gb :Gblame<cr>
