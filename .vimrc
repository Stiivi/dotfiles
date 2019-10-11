set nocompatible

"" Prepend local .vimrc configuration
""
if filereadable($HOME . "/.vimrc.preamble")
    source $HOME/.vimrc.preamble
endif

call plug#begin('~/.vim/plugged')
    Plug 'keith/swift.vim'
    Plug 'majutsushi/tagbar'
    Plug 'kien/ctrlp.vim'
    Plug 'scrooloose/syntastic'
    Plug 'tpope/vim-surround'
    Plug 'Raimondi/delimitMate'
    Plug 'godlygeek/tabular'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'tpope/vim-fugitive'
    Plug 'plasticboy/vim-markdown'
    Plug 'killphi/vim-ebnf'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'vimwiki/vimwiki'
    Plug 'dhruvasagar/vim-table-mode'

call plug#end()

syntax on
"" set termguicolors
color basic16
set background=light

"" Color and style
""
set cursorline
set fillchars=vert:│,fold:-
" hi VertSplit ctermfg=Black ctermbg=DarkGray

"" Formatting
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

set textwidth=79
set colorcolumn=80
set laststatus=2
set linespace=1
set autoindent

set mouse=a
set ttymouse=sgr

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is two spaces (or set this to 4)
set shiftwidth=4                   " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set smarttab
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Formatting
set comments=s1:/*,mb:*,ex:*/,:///,://,b:#,:%,:XCOMM,n:>,fb:-

"" Searching
set hlsearch                   " highlight matches
set incsearch                  " incremental searching
set ignorecase                 " searches are case insensitive...
set smartcase                  " ... unless they contain at least one capital letter
set nu

set wildmenu


"" Swap/bacqup
set backupdir=~/tmp
set noswapfile
set nowritebackup
set nobackup

"" Spelling
set spelllang=en_gb

"" Key maps
nmap <silent> te :NERDTreeToggle<CR>
nmap <silent> <f1> :NERDTreeToggle<CR>
nmap <silent> tt :TagbarToggle<CR>
nmap <silent> <f4> :TagbarToggle<CR>
nmap <silent> tc :SyntasticCheck<CR>
nmap <silent> <f3> :SyntasticCheck<CR>
nmap <silent> tg :Gstatus<CR>
nmap <silent> td :Gvdiff<CR>
nmap <silent> th :Toch<CR>
nmap <silent> tf :Goyo<CR>
nmap <silent> <f2> :w<CR>
imap <silent> <f2> <ESC>:w<CR>
map [l :lprev<CR>
map ]l :lnext<CR>
" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>


"" Plugins
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir']
let g:ctrlp_switch_buffer = 'et'

let delimitMate_nesting_quotes = ['"','`']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_exit_checks = 0

let g:airline_section_x = '%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}'
let g:airline_section_y = ''

let g:python_highlight_builtin_funcs=1
let g:python_highlight_builtin_objs=1

let g:vim_markdown_folding_disabled = 1

let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

"" Recognize markdown objects in the tagbar. Requires separate ctags
"" configuration.
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading:0:1',
        \ 'i:Image:0:0',
        \ 'f:Footnote:0:0',
    \ ],
    \ 'sort'    : 0,
    \ }
let g:tagbar_left = 1

"" Markdown: enable math
let g:vim_markdown_math = 1
set conceallevel=0

let g:syntastic_swift_checkers=["swiftpm", "swiftlint"]
let g:syntastic_python_checkers=["mypy", "pep8", "python"]
let g:syntastic_python_mypy_args="--python-version 3.6 --disallow-untyped-defs --warn-no-return"

"" MacOS Terminal Title - proxy icon to edited document
set title
set t_ts=]6;
set t_fs=
set titlestring=%{bufname('%')==''?'':'file://'.hostname().expand('%:p:gs/\ /%20/')}
set titlelen=0

"" File-type specific
autocmd FileType hs setlocal shiftwidth=2 tabstop=2

"" Append local .vimrc configuration
""
if filereadable($HOME . "/.vimrc.postamble")
    source $HOME/.vimrc.postamble
endif
