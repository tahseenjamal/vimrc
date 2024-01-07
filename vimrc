"filetype plugin onset encoding=utf-8
"set nocompatible
"set t_Co=256
set termguicolors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"
" Move selected lines up and down
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" Move current line up and down
nnoremap <C-k> :m .-2<CR>
nnoremap <C-j> :m .+1<CR>


"let g:CommandTPreferredImplementation='ruby'
"let g:CommandTSuppressMaxFilesWarning=1

"nnoremap <S-t> :terminal . getcwd()<CR>
nnoremap <S-t> :execute "terminal " . getcwd()<CR>

nnoremap <A-z> :tabp<cr>
nnoremap <A-x> :tabn<cr>

"Tab controlled by ALT+Arrow Keys to move the tab
noremap <A-Left>  :-tabmove<cr>
noremap <A-Right> :+tabmove<cr>

"Hit tab key to move to next buffer
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
"nmap <silent> <C-D> :NERDTreeToggle<CR>
"imap <silent> <C-D> :NERDTreeToggle<CR>

nnoremap <leader>a :cclose<CR>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'akitaonrails/command-t'
Plugin 'mtth/scratch.vim'
Plugin 'turbio/bracey.vim'
Plugin 'mattn/emmet-vim'
"Plugin 'cjrh/vim-conda'
Plugin 'gmarik/Vundle.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-bufferline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
call vundle#end()

augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

syntax on
filetype plugin indent on

imap <silent><CR> <CR><Plug>AutoPairsReturn

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1


let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_char = '|'

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'


"Thin cursor in insert mode
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set wrap linebreak nolist
set tabstop=4             " number of spaces that a <tab> represents in a file
set shiftwidth=4          " number of spaces to use for (auto)indent
set expandtab             " expand tabs to spaces
set softtabstop=4         " number of spaces that a <tab> represents
set smarttab              " smart handling of tabs when inserting or deleting

let g:Powerline_symbols = 'fancy'
"set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline

"set background=dark
colorscheme PaperColor
"set background=light
"colorscheme solarized8

set nu
"set rnu

set breakindent

"Powerline delay of ESC
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

