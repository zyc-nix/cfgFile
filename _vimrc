" vimrc
" Author: yanchao <yanchaozhang@gmail.com>
" Source: https://github.com/yanchaozhang/cfgFile
"
" no vi-compatible
set nocompatible              " Don't be compatible with vi
let mapleader=","             " change the leader to be a comma vs slash
filetype off

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Better file browser
Bundle 'scrooloose/nerdtree'
" Class/module browser
Bundle 'majutsushi/tagbar'

" Better editting
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'godlygeek/tabular'
Bundle 'matchit.zip'

" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" solarized
Bundle 'altercation/vim-colors-solarized'
" Autoclose
Bundle 'Townk/vim-autoclose'

" Git integration
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'ghewgill/vim-scmdiff'
Bundle 'sjl/gundo.vim'

" Search tool
Bundle 'mileszs/ack.vim'

" Python suite
" Bundle 'Python-Syntax'
Bundle 'pep8'
Bundle 'nose.vim'
Bundle 'pyflakes.vim'
Bundle 'fs111/pydoc.vim'

" Syntax
Bundle 'Syntastic'

" Auto complete
Bundle 'snipMate'
Bundle 'AutoComplPop'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" ==========================================================
" Basic Settings
" ==========================================================
filetype on                   " try to detect filetypes
syntax on                     " syntax highlighing
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**


""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=2
set foldnestmax=4


" don't outdent hashes
inoremap # #

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.


" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,trail:-,precedes:<,extends:>
set list
set colorcolumn=79

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" NERDTree (better file browser) toggle
map <F3> :NERDTreeToggle<CR>
map <leader>nt :NERDTreeToggle<CR>

" toggle Tagbar display
"let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_right=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_usearrows = 1
map <F4> :TagbarToggle<CR>
nmap <leader>tb :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" Ack searching
nmap <leader>as <Esc>:Ack!

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 

" unimpaired plugin, quickfix, spell checking, etc
" ]q :cn<CR>
" [q :cp<CR>
" Spell checking default move ]s, [s
map <leader>sa zg
map <leader>s? z=

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" show pending tasks list
map <F2> :TaskList<CR>

" save as sudo
ca w!! w !sudo tee "%"

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" colorscheme
set t_Co=256
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme default
"colorscheme solarized

" syntastic checking
let g:syntastic_echo_current_error=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
" Check manually
noremap <leader>sc :SyntasticCheck<cr>

" ==========================================================
" Python
" ==========================================================
"au BufReadt *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
let g:SuperTabDefaultCompletionType = "context"
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" pep8
let g:pep8_map='<leader>8'

" pydoc
let g:pydoc_cmd='python -m pydoc'
let g:pydoc_open_cmd='vsplit'

