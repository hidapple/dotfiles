"================================
" Basic Settings
"================================
set encoding=utf-8
scriptencoding utf-8
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
  augroup tabwidth
    autocmd! FileType java setlocal shiftwidth=4 tabstop=4
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

""" Syntax Color
syntax on
colorscheme molokai
set t_Co=256

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
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.dotfiles/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:toml_lazy = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

""" Check not installed plugins
if dein#check_install()
  call dein#install()
endif

