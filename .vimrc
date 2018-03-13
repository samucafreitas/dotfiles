"       .__
" ___  _|__| ____________   ____
" \  \/ /  |/     \_  __ \_/ ___\
"  \   /|  |  Y Y  \  | \/\  \___
"   \_/ |__|__|_|  /__|    \___  >
"                \/            \/
" File              : .vimrc
" Author            : Sam Uel <samuelfreitas@linuxmail.org>
" Date              : 09 feb 2016
" Last Modified Date: 28 feb 2018
" Last Modified By  : Sam Uel <samuelfreitas@linuxmail.org>
execute pathogen#infect()

set t_Co=256
set guifont=InconsolataForPowerline\ Nerd\ Font\ 12
set guioptions-=T
set guioptions-=r
set go-=L
set laststatus=2
set backspace=indent,eol,start
set clipboard=unnamedplus
set encoding=utf-8
set ai
set showmatch
set textwidth=79
set nowrap
set textwidth=0 wrapmargin=0
set nu
set expandtab
set tabstop=4
set shiftwidth=4
set nobackup
set noswapfile
set nowritebackup
set timeoutlen=1000
set ttimeoutlen=0
set showcmd
set ignorecase
set smartcase
set cursorline
set hlsearch
set mouse=a

let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1
"let g:gruvbox_contrast_dark='neutral'
colorscheme cottonmouse

"FileType
autocmd FileType haskell map <F5> :!ghci %
autocmd FileType haskell imap <F5> <ESC> :!ghci

autocmd FileType python setlocal completeopt-=preview
autocmd FileType python map <F5> :!python3 %
autocmd FileType python imap <F5> <ESC> :!python3 %

autocmd FileType javascript map <F5> :!node %
autocmd FileType javascript imap <F5> <ESC> :!node %

autocmd FileType cpp map <F5> :!g++ % && ./a.out
autocmd FileType cpp imap <F5> <ESC> :!g++ % && ./a.out

autocmd FileType go map <F5> :!go run %
autocmd FileType go imap <F5> <ESC> :!go run %

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2

autocmd FileType html map <F5> :!google-chrome-stable %
autocmd FileType html imap <F5> <ESC> :!google-chrome-stable %

"My mapping keys
nnoremap <C-c> "+y
vnoremap <C-c> "+y
vnoremap <C-v> c<ESC>"+p
inoremap <C-v> <ESC>"+pa
nnoremap <C-v> "+pa
nnoremap b <C-v>
vmap <S-TAB> <
vmap <TAB> >
imap fd <ESC>
nmap <Space>fs :w <CR>
nmap <Space>ft :NERDTree <CR>
nnoremap c <Esc>:
vnoremap n <Esc>
nnoremap _ :sp <CR>
nnoremap \| :vsp <CR>
nnoremap <Left> :vertical resize -1 <CR>
nnoremap <Right> :vertical resize +1 <CR>
nnoremap <Up> :resize +1 <CR>
nnoremap <Down> :resize -1 <CR>
nmap <F1> :%!xxd <CR>
nmap <F2> :%!xxd -r <CR>
nmap <F8> :TagbarToggle<CR>
nmap <S-l> $
nmap <S-h> 0

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Smarter tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_min_count = 2

" tabs
nnoremap <C-o> :tabprevious<CR>
nnoremap <C-p> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'othree/html5.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdTree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on

if has("syntax")
    syntax on
endif

if &term =~ "xterm\\|rxvt"
  " use an purple cursor in insert mode
  let &t_SI = "\<Esc>]12;#db3f62\x7"
  " use a gray cursor otherwise
  let &t_EI = "\<Esc>]12;gray\x7"
  silent !echo -ne "\033]12;gray\007"
  " reset cursor when vim exits
  autocmd VimLeave * !echo -ne "\033]12;gray\007"
endif

let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinPos = "right"

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
