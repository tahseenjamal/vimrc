" Disable visual bell and turn off error beeping
set visualbell t_vb=

" Enable true color support
set termguicolors

" Set 24-bit RGB colors for terminal foreground and background
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"   " 8-bit color foreground
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"   " 8-bit color background

" Set leader key to space
let mapleader = " "

" File and buffer shortcuts
nnoremap <Leader>f :Files .<CR>
nnoremap <Leader>rg :RG <CR>
nnoremap <Leader>rG :Rg <CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>c :Commands<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>q :BufOnly<CR>
nnoremap <leader>x :q<CR>

" Move selected lines up/down in visual mode
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" Move current line up/down in normal mode
nnoremap <C-k> :m .-2<CR>
nnoremap <C-j> :m .+1<CR>

" Terminal shortcuts for opening a floating terminal and lazygit
nnoremap <silent> <leader>t :FloatermNew --autoclose=1<CR>
nnoremap <silent> <leader>gg :FloatermNew --autoclose=1 --width=0.8 --height=0.8 lazygit<CR>

" Save buffer and switch to the next/previous one using Tab
nnoremap <silent> <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Toggle ZoomWinTab
nnoremap <leader>z :ZoomWinTabToggle<CR>

" Replacing words
nnoremap <leader>rp :Replace <C-r>=expand("<cword>")<CR><Space>

" Renameing function and variable names
nmap <leader>rn <Plug>(coc-rename)

" Choose window using vim-choosewin
nnoremap <leader>w :ChooseWin<CR>

" EasyMotion mappings for word navigation
nmap <C-s> <Plug>(easymotion-w)
nmap <C-b> <Plug>(easymotion-b)

" Vundle plugin manager configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin list
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'PhilRunninger/nerdtree-visual-selection'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'Yggdroot/indentLine'
Plugin 'andymass/vim-matchup'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'dkprice/vim-easygrep'
Plugin 'easymotion/vim-easymotion'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim', {'name': 'fzf-vim'}
Plugin 'mattn/emmet-vim'
Plugin 'mtth/scratch.vim'
Plugin 'preservim/nerdtree'
Plugin 'psf/black'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'
Plugin 'segeljakt/vim-silicon'
Plugin 't9md/vim-choosewin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'tpope/vim-surround'
Plugin 'troydm/zoomwintab.vim'
Plugin 'turbio/bracey.vim'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'voldikss/vim-floaterm'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'itchyny/lightline.vim'
Plugin 'mengelbrecht/lightline-bufferline'
call vundle#end()

" Auto filetype detection and syntax highlighting
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" Enable syntax highlighting and filetype-specific settings
syntax on
filetype plugin indent on

" AutoPairs mapping for handling automatic pairs in insert mode
imap <silent><CR> <CR><Plug>AutoPairsReturn

" Buffer and tabline settings
set hidden            " Allow switching buffers without saving
set showtabline=2     " Always show tabline

" Enable devicons in fzf file finder
let g:webdevicons_enable = 1
let g:webdevicons_enable_fzf_vim = 1

" Lightline and bufferline configuration with custom icons
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '
let g:lightline_buffer_enable_devicons = 1
let g:lightline#bufferline#show_number = 1
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']
let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20
let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified'] ]
            \ },
            \ 'tabline': {
            \   'left': [ ['buffers'] ],
            \   'right': [ ['close'] ]
            \ },
            \ 'component_expand': {
            \   'buffers': 'lightline#bufferline#buffers'
            \ },
            \ 'component_type': {
            \   'buffers': 'tabsel'
            \ },
            \ 'component_function': {
            \   'coc_gitbranch': 'CocGitBranch',
            \   'coc_gitstatus': 'CocGitStatus'
            \ }
            \ }

" Function to get the current Git branch using coc-git
function! CocGitBranch() abort
    let l:branch = get(b:, 'coc_git_branch', '')
    return (empty(l:branch) ? '' : ' ' . l:branch)
endfunction

" Function to get the Git diff (added, modified, removed) using coc-git
function! CocGitStatus() abort
    let l:status = get(b:, 'coc_git_status', '')
    return (empty(l:status) ? '' : l:status)
endfunction




" Vim-matchup settings for better matching of parentheses
let g:matchup_matchparen_offscreen = {'method': 'popup'}
let g:matchup_matchparen_hi_surround_always = 1

" IndentLine settings for visualizing indentation levels
let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_char = '|'

" Vim-choosewin settings for displaying windows with an overlay
let g:choosewin_overlay_enable = 1

" Cursor shape settings: thin cursor in insert mode
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Enable system clipboard integration
set clipboard=unnamed,unnamedplus

" Wrapping, tab, and indentation settings
set wrap linebreak nolist           " Enable word wrapping with line break at spaces
set tabstop=4                       " Number of spaces per tab
set shiftwidth=4                    " Number of spaces per indentation level
set expandtab                       " Convert tabs to spaces
set softtabstop=4                   " Number of spaces for a tab in insert mode
set smarttab                        " Tab behavior based on context

" Silicon settings for generating screenshots
let g:silicon = {
            \'theme': 'Dracula',
            \'output': '~/Downloads/'
            \}
vnoremap <leader>s :Silicon<CR>

set laststatus=2   " Always show the statusline

" Set dark background and PaperColor theme
set background=dark
colorscheme PaperColor

" Enable relative numbering and break indent
set rnu
set breakindent

" Powerline escape delay for better responsiveness
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif


