syntax on
set history=500 "Max search pattern to store
set number "Line number
set showmode "Show Vim mode on last line
set ignorecase "no case sensitive in pattern
set smartcase "case sensitive only when caps is used
set smartindent "auto indend
set expandtab
set shiftwidth=4 "autoindent tab chars
set softtabstop=4 "already present tabs are considered as 4 spaces

" Disable line numbers in terminal mode
au TermOpen * setlocal nonumber norelativenumber

" :W sudo saves the file (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

set scrolloff=7 " Set 7 lines to the cursor - when moving vertically using j/k
set mouse=a " Enable Mouse
set cmdheight=2 " Height of the command bar
set hid " A buffer becomes hidden when it is abandoned

" Don't redraw while executing macros (good performance config)
" set lazyredraw 

" Line length
set linebreak
set tw=500

" Window title
set titlestring=NVIM
set title

" Moving between windows
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"Y to works from the cursor to the end of line (not Vi-compatible) use
map Y y$

"Escape from terminal mode
tnoremap <Esc> <C-\><C-n>

" Clipboard setup (Linux version, requires xsel)
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': 'xsel --clipboard --input',
      \      '*': 'xsel --clipboard --input',
      \   },
      \   'paste': {
      \      '+': 'xsel --clipboard --output',
      \      '*': 'xsel --clipboard --output',
      \   },
      \   'cache_enabled': 1,
      \ }



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
""""" Completion/Compilation
Plug	'https://github.com/Shougo/deoplete.nvim.git', { 'do': ':UpdateRemotePlugins' }
Plug	'https://github.com/Shougo/neoinclude.vim.git'
Plug	'https://github.com/neomake/neomake.git'
Plug	'https://github.com/lervag/vimtex.git'
Plug	'https://github.com/jiangmiao/auto-pairs.git'
""""" Utility
Plug	'https://github.com/kien/ctrlp.vim.git'
Plug	'https://github.com/scrooloose/nerdtree.git', { 'on': 'NERDTreeToggle' }
Plug	'https://github.com/scrooloose/nerdcommenter.git'
Plug	'https://github.com/airblade/vim-gitgutter.git'
Plug    'https://github.com/tpope/vim-speeddating.git'
""""" Appereance 
Plug	'https://github.com/joshdick/onedark.vim.git'
Plug	'https://github.com/junegunn/goyo.vim.git', {'on': 'Goyo'}
Plug	'https://github.com/itchyny/lightline.vim.git'
""""" Haskell
" Plug	'https://github.com/neovimhaskell/haskell-vim.git'
" Plug	'https://github.com/enomsg/vim-haskellConcealPlus.git'
" Plug	'https://github.com/parsonsmatt/intero-neovim.git'
call plug#end()


"""""""""""""""""""""""
"""""" ONEDARK """"""
"""""""""""""""""""""""
"Use 24-bit (true-color) mode in Vim/Neovim.
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

colorscheme onedark
" Colorscheme for lightline
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE


"""""""""""""""""""""""
""""" HASKELL VIM """""
"""""""""""""""""""""""
"let g:haskell_classic_highlighting = 1
"let g:haskell_indent_if = 3
"let g:haskell_indent_case = 2
"let g:haskell_indent_let = 4
"let g:haskell_indent_where = 6
"let g:haskell_indent_before_where = 2
"let g:haskell_indent_after_bare_where = 2
"let g:haskell_indent_do = 3
"let g:haskell_indent_in = 1
"let g:haskell_indent_guard = 2
"let g:haskell_indent_case_alternative = 1
"let g:cabal_indent_section = 2


"""""""""""""""""""""""
"""""" NERD TREE """"""
"""""""""""""""""""""""
"Toggle NERDTree with Ctrl-N
map <C-n> :NERDTreeToggle<CR>

"Show hidden files in NERDTree
"let NERDTreeShowHidden=1


"""""""""""""""""""""""
""""""" NEOMAKE """""""
"""""""""""""""""""""""
function! MyOnBattery()
  return has('unix') && readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction

if GetRunningOS() =~ "linux" &&  MyOnBattery() 
  call neomake#configure#automake('w') " When writing a buffer.
else 
  call neomake#configure#automake('nw', 1000) " When writing a buffer, and on normal mode changes (after 750ms).
endif

" Automatically disables ghcmod-hlint-hdevtools
" let g:neomake_haskell_enabled_makers = []


""""""""""""""""""""""""""""""""""""""
"""""" VIM HASKELL CONCEAL PLUS """"""
""""""""""""""""""""""""""""""""""""""
"let hscoptions="𝐌𝐄rbhm↱wTt"


""""""""""""""""""""""""""""""""""""""
""""""""""""" DEOPLETE """""""""""""""
""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'around']


""""""""""""""""""""""""""""""""""""""
"""""""""""""" VIMTEX """"""""""""""""
""""""""""""""""""""""""""""""""""""""
let g:vimtex_compiler_progname = 'nvr'

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete


""""""""""""""""""""""""""""""""""""""
"""""""""" NERD COMMENTER """"""""""""
""""""""""""""""""""""""""""""""""""""
map <C-_> <leader>c<space>


""""""""""""""""""""""""""""""""""""""
""""""""""""""" GOYO """""""""""""""""
""""""""""""""""""""""""""""""""""""""
let g:goyo_width=83

