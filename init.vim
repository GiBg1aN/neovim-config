syntax on
set history=500 "Max search pattern to store
set number "Line number
set noshowmode "Show Vim mode on last line
set ignorecase "no case sensitive in pattern
set inccommand=nosplit "real_time substitute command
set smartcase "case sensitive only when caps is used
set smartindent "auto indent
set expandtab "replace tabs with spaces
set shiftwidth=4 "autoindent tab chars
set softtabstop=4 "already present tabs are considered as 4 spaces
set scrolloff=7 " Set 7 lines to the cursor - when moving vertically using j/k
set mouse=a " Enable Mouse
set cmdheight=2 " Height of the command bar
set hidden " A buffer becomes hidden when it is abandoned
set lazyredraw " Don't redraw while executing macros (good performance config)
set linebreak
set textwidth=500 " Line length

" Window title
set titlestring=NVIM
set title

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Edit/Save vimrc file
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" Filetype based options
let g:tex_flavor="latex"
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2

" Moving between windows in normal and terminal mode
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Y to works from the cursor to the end of line (not Vi-compatible) use
map Y y$

"Escape from terminal mode and escape 'Esc' key in terminal mode
"tnoremap <Esc> <C-\><C-n>
tnoremap <Leader><ESC> <C-\><C-n>


" Disable line numbers in terminal mode
au TermOpen * setlocal nonumber norelativenumber


""" My font is Source Code Pro
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
""""" Completion/Compilation
Plug	'jiangmiao/auto-pairs'
""""" Utility
Plug    'simnalamburt/vim-mundo'
Plug	'scrooloose/nerdcommenter'
Plug	'airblade/vim-gitgutter'
""""" Appereance 
Plug	'joshdick/onedark.vim'
Plug	'itchyny/lightline.vim'
Plug    'Yggdroot/indentLine'
Plug    'psliwka/vim-smoothie'
call plug#end()

"""" VIM-GITGUTTER """"
set updatetime=2000

""""""" ONEDARK """""""
"For Neovim > 0.1.5 and Vim > patch 7.4.1799
if (has("termguicolors"))
    set termguicolors
endif

colorscheme onedark
" Colorscheme for lightline
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" Terminal cursor in normal mode
hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE

"""""""""" NERD COMMENTER """"""""""""
map <C-_> <leader>c<space>
filetype plugin on


"""""""""" VIM INDENT LINE """""""""""
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_bufTypeExclude = ['help', 'terminal']


""""""""""""""" MUNDO """"""""""""""""
nnoremap <F5> :MundoToggle<CR>
