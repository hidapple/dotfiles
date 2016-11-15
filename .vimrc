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

  """ Load plugins
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

"================================
" Basic Settings
"================================
filetype plugin indent on

""" Color Scheme
syntax enable
colorscheme molokai
set t_Co=256

set encoding=utf-8
scriptencoding utf-8
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
  augroup tabwidth
    autocmd! FileType php  setlocal shiftwidth=4 tabstop=4
    autocmd! FileType c    setlocal shiftwidth=4 tabstop=4
  augroup END
set relativenumber
set number
set title
set ruler
set cursorline
set cursorcolumn
set showmatch
set list
set listchars=tab:»-,trail:_,extends:»,precedes:«
set visualbell t_vb=
set laststatus=2
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P
set smartcase
set incsearch
set wrapscan
set backspace=indent,eol,start
set noswapfile
set nobackup
set formatoptions+=mM

""" When editing a file, always jump to the last cursor position
augroup jumpPos
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

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

