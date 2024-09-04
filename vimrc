"filetype plugin onset encoding=utf-8
"set nocompatible
"set t_Co=256
set visualbell t_vb=

set termguicolors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let mapleader = " "
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>rg :Rg <CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>c :Commands<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>q :BufOnly<CR>

" Move selected lines up and down
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" Move current line up and down
nnoremap <C-k> :m .-2<CR>
nnoremap <C-j> :m .+1<CR>

nnoremap <silent> <leader>t :FloatermNew --autoclose=1<CR>
nnoremap <silent> <leader>gg :FloatermNew --autoclose=1 --width=0.8 --height=0.8 lazygit<CR>

nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

nnoremap <leader>z :ZoomWinTabToggle<CR>

nnoremap <leader>rn :Replace <C-r>=expand("<cword>")<CR><Space>

nnoremap <leader>w :ChooseWin<CR>


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'akitaonrails/command-t'
Plugin 't9md/vim-choosewin'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'voldikss/vim-floaterm'
Plugin 'dkprice/vim-easygrep'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'segeljakt/vim-silicon'
Plugin 'troydm/zoomwintab.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim', {'name': 'fzf-vim'}
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
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'PhilRunninger/nerdtree-visual-selection'
"Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-vinegar'
Plugin 'ctrlpvim/ctrlp.vim'
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

let g:silicon = {
    \'theme': 'Dracula',
    \'output': '~/Downloads/'
    \}
vnoremap <leader>s :Silicon<CR>

let g:Powerline_symbols = 'fancy'
"set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline

set background=dark
colorscheme PaperColor
"set background=light
"colorscheme solarized8

"set nu
set rnu

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

