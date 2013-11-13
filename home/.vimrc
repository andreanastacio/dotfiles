set nocompatible

" Vundle setup
filetype off " required by Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-rails'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'

filetype plugin indent on

syntax on
colorscheme espresso-soda

" Display incomplete commands.
set showcmd
" Display the mode you're in.
set showmode

" Intuitive backspacing.
set backspace=indent,eol,start
" Handle multiple buffers better.
set hidden

" Enhanced command line completion.
set wildmenu
" Complete files like a shell.
set wildmode=list:longest

" Case-insensitive searching.
set ignorecase

" Show line numbers.
set number
" Show cursor position.
set ruler

" Highlight matches as you type.
set incsearch
" Don't highlight matches.
set nohlsearch

" Turn off line wrapping.
set nowrap
" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title
" No beeping.
set visualbell

" Don't make a backup before overwriting a file.
set nobackup
" And again.
set nowritebackup
" Keep swap files in one location
set directory=$HOME/.vim/tmp//,.

" Global tab width.
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" Edit and load vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Toggles NERDtree
noremap <leader>nt :NERDTreeToggle<CR>

let g:NERDTreeHijackNetrw = 0

" Powerline options
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1

" Custom ignores
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|class'

" Yankring default mapping conflicts with CtrlP
let g:yankring_replace_n_pkey = '<C-M>'

" Sets markdown syntax for *.md files.
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Sets javascript syntax for *.json files.
autocmd BufRead,BufNewFile *.json set filetype=javascript
"
" Wrap markdown files.
autocmd BufRead,BufNewFile *.md set wrap

" Files open expanded
set foldlevelstart=20

" Toggles folding with space
nnoremap <Space> za
