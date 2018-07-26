source ~/.config/nvim/bundle/vim-pathogen/autoload/pathogen.vim
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

set history=500

" set nocompatible
set encoding=utf8
set number
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set laststatus=2 "statusbar always on

" Disable line numbers in terminal mode
au TermOpen * setlocal nonumber norelativenumber

" :W sudo saves the file (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
set mouse=a " Enable Mouse
set cmdheight=2 " Height of the command bar
set hid " A buffer becomes hidden when it is abandoned

" Don't redraw while executing macros (good performance config)
" set lazyredraw 


set magic " For regular expressions turn magic on

" Line length
set linebreak
set wrap
set tw=500

" Moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""
"""""" ONEDARK """"""
"""""""""""""""""""""""

colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

"""""""""""""""""""""""
""""" HASKELL VIM """""
"""""""""""""""""""""""

let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2


"""""""""""""""""""""""
"""""" NERD TREE """"""
"""""""""""""""""""""""

"Toggle NERDTree with Ctrl-N
map <C-n> :NERDTreeToggle<CR>

"Show hidden files in NERDTree
let NERDTreeShowHidden=1


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

let hscoptions="𝐌𝐄rbhm↱wTt"


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

