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

    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'liuchengxu/vista.vim'
    Plug 'cespare/vim-toml'
    Plug 'morhetz/gruvbox'

call plug#end()

syntax on
"" set termguicolors
color basic16
set background=dark

"" Color and style
""
set cursorline
set fillchars=vert:┃,fold:-,stl:─,stlnc:━
" hi VertSplit ctermfg=Black ctermbg=DarkGray

"" Formatting
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

set linebreak
set textwidth=79
set colorcolumn=80
set laststatus=2
set linespace=1
set autoindent
set display+=lastline

set mouse=a
if !has('nvim')
    set ttymouse=sgr
endif

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
let g:ctrlp_custom_ignore = '__pycache__\|git'
let g:ctrlp_switch_buffer = 'et'

let delimitMate_nesting_quotes = ['"','`']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_exit_checks = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++2a -stdlib=libc++'

let g:syntastic_cpp_compiler = 'cc'
let g:syntastic_cpp_compiler_options = ' -std=c17 -stdlib=libc++'


let g:airline_section_x = '%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}'
let g:airline_section_y = ''

let g:python_highlight_builtin_funcs=1
let g:python_highlight_builtin_objs=1

let g:NERDTreeWinPos = "left"
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
let g:tagbar_left = 0

"" Markdown: enable math
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
set conceallevel=2

set nonumber
set statusline=%t%m%r
set statusline+=%m
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=%l/%L

let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
"" let g:syntastic_auto_loc_list = 1

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

"" LSP - Language Server Protocol
"" ==============================

""if executable('sourcekit-lsp')
if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif
autocmd FileType swift setlocal omnifunc=lsp#complete
autocmd FileType swift nnoremap <C-]> :LspDefinition<CR>
let g:lsp_diagnostics_echo_cursor = 1 


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gT <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

