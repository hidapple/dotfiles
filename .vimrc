" ===============================
" neovim
" ===============================
let g:python_host_prog = expand('~/.pyenv/versions/2.7.12/bin/python')
let g:python3_host_prog = expand('~/.pyenv/shims/python')

"================================
" Dein.vim
"================================
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repo/github.com/Shougo/dein.vim'

""" Clone Dein.vim if needed
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

""" Dein.vim setting
let s:toml_file = '~/.vim/rc/dein.toml'
let s:toml_lazy = '~/.vim/rc/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [s:toml_file, s:toml_lazy])

  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

"================================
" Settings
"================================
filetype plugin indent on
set encoding=utf-8
scriptencoding utf-8

""" Color Scheme
syntax enable
colorscheme molokai
set t_Co=256

""" Status Line
set laststatus=2
set noshowmode

""" Indent
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2

""" Options
set relativenumber
set number
set title
set ruler
set cursorline
set cursorcolumn
set showmatch
set list
set listchars=tab:\|\ ,trail:_,extends:»,precedes:«
set visualbell t_vb=
set smartcase
set incsearch
set hlsearch
set wrapscan
set backspace=indent,eol,start
set noswapfile
set nobackup
set formatoptions+=mMj
augroup textwidth
  autocmd! FileType go setlocal textwidth=100
augroup END

source $VIMRUNTIME/macros/matchit.vim

""" When editing a file, always jump to the last cursor position
augroup jumpPos
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

""" Filetype detection
autocmd BufNewFile,BufRead *.{html,htm,vue} set filetype=html
autocmd BufNewFile,BufRead Jenkinsfile*     set filetype=groovy

"================================
" Key mapping
"================================
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap {<Enter> {}<LEFT><CR><ESC><S-o>
inoremap [<Enter> []<LEFT><CR><ESC><S-o>
inoremap (<Enter> ()<LEFT><CR><ESC><S-o>
inoremap '' ''<LEFT>
inoremap "" ""<LEFT>
noremap s> <C-w>>
noremap s< <C-w><
noremap s+ <C-w>+
noremap s- <C-w>-
noremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
noremap! <C-c> <Nop>
