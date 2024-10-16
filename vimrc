" https://github.com/tahseenjamal/vimrc
"
"
" This has to be run to install vim plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"If you are using iTerm2 then you need to set Meta key as +Esc
" Switch to +Esc in iTerm2 profile
" Meta + b and f for left and right arrow
"
" Disable visual bell and turn off error beeping
set visualbell t_vb=

" Don't show extra line
set noshowmode

" Enable true color support
set termguicolors


" Set 24-bit RGB colors for terminal foreground and background
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"   " 8-bit color foreground
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"   " 8-bit color background

" Set leader key to space
let mapleader = " "

" Use 'Tab' to select the current item in the completion menu (Ctrl-y)
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

" File and buffer shortcuts
nnoremap <Leader>ff :call fzf#run(fzf#wrap({'source': 'find * -type f ! -name "*.swp"', 'options': '--preview "bat --color always {}"'}))<CR>
nnoremap <Leader>fg :RG <CR>
nnoremap <Leader>rg :Rg <CR>
nnoremap <Leader>bf :Buffers<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bu :bd!<CR>
nnoremap <leader>bc :close<CR>
nnoremap <leader>q :BufOnly<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>c :Commands<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>x :q<CR>
nnoremap <leader>n :enew<CR>
nnoremap <leader>u :UndotreeToggle<CR>


" Map leader + tc to open the Colors menu
nnoremap <leader>th :call OpenColorsMenu()<CR>
" Map leader + ts to save the selected colorscheme
nnoremap <leader>ts :call SaveColorscheme()<CR>
" Map Ctrl + ` to toggle background
nnoremap <C-`> :call ToggleBackground()<CR>

" Move selected block in Visual Mode
"vnoremap <C-k> :m '<-2<CR>gv=gv
"vnoremap <C-j> :m '>+1<CR>gv=gv

" Move line up/down in Normal Mode
"nnoremap <C-k> :m .-2<CR>
"nnoremap <C-j> :m .+1<CR>

" Terminal shortcuts for opening a floating terminal and lazygit
nnoremap <silent> <leader>te FloatermNew --autoclose=2<CR>
nnoremap <silent> <leader>gg :FloatermNew --autoclose=2 --width=0.8 --height=0.8 lazygit<CR>

" Save buffer and switch to the next/previous one using Tab
nnoremap <silent> <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Toggle ZoomWinTab
nnoremap <leader>z :ZoomWinTabToggle<CR>

" Replace current word
nnoremap <leader>rp :Replace <C-r>=expand("<cword>")<CR><Space>

nmap <leader>rn <Plug>(coc-rename)
" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>rv  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>rv  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>l  <Plug>(coc-codelens-action)


" Choose window using vim-choosewin
nnoremap <leader>w :ChooseWin<CR>


" EasyMotion mappings for word navigation
nmap <C-s> <Plug>(easymotion-s)

" Vim Plug plugin manager configuration
call plug#begin('~/.vim/plugged')

" Plugin list
Plug 'matze/vim-move'
Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'andymass/vim-matchup'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dkprice/vim-easygrep'
Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go'
Plug 'gmarik/Vundle.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim', {'name': 'fzf-vim'}
Plug 'mattn/emmet-vim'
Plug 'mtth/scratch.vim'
Plug 'preservim/nerdtree'
Plug 'psf/black'
Plug 'scrooloose/nerdcommenter'
Plug 'segeljakt/vim-silicon'
Plug 't9md/vim-choosewin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-surround'
Plug 'troydm/zoomwintab.vim'
Plug 'turbio/bracey.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'voldikss/vim-floaterm'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'
Plug 'rhysd/vim-clang-format'
Plug 'mbbill/undotree'

call plug#end()

set encoding=UTF-8
let g:choosewin_overlay_font_size = 'small'

" vim-move configuration for normal and visual block selection
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'C'

" Enable clang-format for C/C++ files
autocmd BufWritePre *.c,*.cpp,*.h ClangFormat


" Move to the between windows
" 4 lines for kitty term where set 
" macos_option_as_alt yes
nnoremap <Esc>h <C-w>h
nnoremap <Esc>j <C-w>j
nnoremap <Esc>k <C-w>k
nnoremap <Esc>l <C-w>l
" iterm2
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

let g:coc_global_extensions = [
            \ 'coc-git',
            \ 'coc-clangd',
            \ 'coc-pyright',
            \ 'coc-go',    
            \ ]

" Go to end in insert mode
inoremap <C-a> <Esc>A
" Go to line below in insert mode
inoremap <C-e> <Esc>o
" Go to line above in insert mode
inoremap <C-E> <Esc>O

" Hide the ~ symbols in NERDTree by setting end of buffer character to a space
autocmd FileType nerdtree setlocal fillchars=eob:\ 

" Enable syntax highlighting and filetype-specific settings
syntax on
filetype plugin indent on


" AutoPairs mapping for handling automatic pairs in insert mode
imap <silent><CR> <CR><Plug>AutoPairsReturn

" Use <C-j> and <C-k> to navigate through the completion suggestions
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"


" Buffer and tabline settings
set hidden            " Allow switching buffers without saving
set showtabline=2     " Always show tabline

let g:black_linelength = 79
autocmd BufWritePre *.py execute ':Black'

" Enable devicons in fzf file finder
let g:webdevicons_enable = 1
let g:webdevicons_enable_fzf_vim = 1

" Lightline and bufferline configuration with custom icons
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#enable_nerdfont = 1
"let g:lightline#bufferline#show_number = 2
"let g:lightline#bufferline#number_separator = ' | '
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#logo = ' '
let g:lightline#bufferline#readonly_icon = ''
let g:lightline#bufferline#git_icon = ' '
let g:lightline#bufferline#ellipsis_icon = '..'
"let g:lightline#bufferline#expand_left_icon = '󱎕'
"let g:lightline#bufferline#expand_right_icon = ''
let g:lightline#bufferline#active_buffer_left_icon = ''
let g:lightline#bufferline#active_buffer_right_icon = ''
"let g:lightline#bufferline#separator_icon = ''
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#icon_position = 'left'
let g:lightline#bufferline#fname_mod = ':t'
let g:lightline#bufferline#excludes = ['vimfiler']
let g:lightline#bufferline#maxflen = 30
let g:lightline#bufferline#maxfextlen = 3
let g:lightline#bufferline#minflen = 16
let g:lightline#bufferline#minfextlen = 3
let g:lightline#bufferline#reservelen = 20


let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified'] ],
            \   'right': [ [ 'lineinfo' ],[ 'percent' ], ['folder'],['filetype_icon' ] ]
            \ },
            \ 'separator' : { 'left': '', 'right': '󱎕' },
            \ 'subseparator' : {'left': '', 'right': '󱎕' },
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
            \   'coc_gitstatus': 'CocGitStatus',
            \   'folder': 'LightlineFolder',
            \   'filetype_icon': 'LightlineFiletypeIcon'
            \ }
            \ }


" Define custom functions for folder and filetype icon
function! LightlineFolder()
  return ' ' .. expand('%:p:h:t')  " Returns the folder name of the current file
endfunction

function! LightlineFiletypeIcon()
  let l:icon = WebDevIconsGetFileTypeSymbol()  " Get filetype icon using vim-devicons
  return l:icon . ' ' . &filetype
endfunction

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
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

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
"set background=dark
"colorscheme PaperColor
"colorscheme catppuccin_frappe
"colorscheme gruvbox8
if filereadable(expand("~/.vim/colorscheme.vim"))
    source ~/.vim/colorscheme.vim
endif

" windows separator line
"set fillchars+=vert:┃
"set fillchars+=vert:\┃
set fillchars+=vert:┃,eob:\ 


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


" Step 1: Run the :Colors command and allow the user to interact
function! OpenColorsMenu()
    execute ":Colors"
endfunction

" Step 2: Save the currently selected colorscheme
function! SaveColorscheme()
    " Get the currently selected colorscheme
    let l:color_scheme = execute('colorscheme')
    let l:color_scheme = substitute(l:color_scheme, '\n', '', '')
    " Define the file path for saving the colorscheme
    let colorscheme_file = expand("~/.vim/colorscheme.vim")

    " Write the colorscheme to the file
    let colorscheme_command = "colorscheme " . l:color_scheme
    call writefile([colorscheme_command], colorscheme_file)
    echo "Colorscheme saved to " . l:colorscheme_file

endfunction


" Function to toggle between 'dark' and 'light' backgrounds
function! ToggleBackground()
    if &background == 'dark'
        set background=light
    else
        set background=dark
    endif
endfunction

