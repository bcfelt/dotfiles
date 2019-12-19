" Don't try to be vi compatible
set nocompatible

" Set shell to be interactive for :term nice-ness
set shellcmdflag=-ic

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" BEGIN tpope section because he is a God
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-tbone'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-dadbod'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-eunuch'
" END tpope section
" BEGIN Other Utility Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'jceb/vim-orgmode'
Plugin 'godlygeek/tabular' " required by vim-markdown
" END Other Utility Plugins
" BEGIN Language Specific Plugins
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'ernstvanderlinden/vim-coldfusion'
Plugin 'chrisbra/csv.vim'
" END Language Specific Plugins
" BEGIN Colorschemes
" ln -svf ~/.vim/bundle/vim-color-spring-night/colors/spring-night.vim ~/.vim/colors/
Plugin 'rhysd/vim-color-spring-night'
" ln -svf ~/.vim/bundle/awesome-vim-colorschemes/colors/* ~/.vim/colors/
Plugin 'rafi/awesome-vim-colorschemes'
" END Colorschemes

" Plugins MUST go above this line
call vundle#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number
set relativenumber

" BEGIN vim-airline settings
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }

let g:airline_detect_paste=1
let g:airline_detect_modified=1
let g:airline_detect_crypt=1
" END vim-airline settings

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=0
set wrapmargin=0
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent
" show leading spaces
hi Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey
autocmd BufWinEnter * setlocal conceallevel=2 concealcursor=nv
autocmd BufWinEnter * syn match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
autocmd BufReadPre * setlocal conceallevel=2 concealcursor=nv
autocmd BufReadPre * syn match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
colorscheme solarized8

" Syntax Highlighting for CFML
au BufReadPost *.cfm set syntax=cf
au BufReadPost *.cfml set syntax=cf
au BufReadPost *.cfc set syntax=cf

" Set <Leader>
let mapleader=" "

" Map for upload
nnoremap <Leader>up :echom expand('%')

" netrw setup to maybe mimic NERDtree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
autocmd VimEnter * if @% == "" | execute 'Explore' | endif

" Snippets - make ,snp fill command mode with read command to read in from
" file located in ~/.vim/snips/
nnoremap ,snp :-1read ~/.vim/snips/
