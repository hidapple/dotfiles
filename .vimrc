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
" colorscheme monokai
" colorscheme hybrid
set t_Co=256

""" Keymap
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
" Neobundle Settings
"================================
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tyru/caw.vim.git'
  nmap <C-_> <Plug>(caw:i:toggle)
  vmap <C-_> <Plug>(caw:i:toggle)
NeoBundle 'surround.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
  nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
  nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
  nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
NeoBundle 'tpope/vim-rails'
NeoBundle 'thinca/vim-quickrun'
  let g:quickrun_config = {
\   '_' : {
\     'outputter/buffer/close_on_empty' : 1
\   }
\ }

""" Snippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

NeoBundle 'Shougo/neocomplete.vim'
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

NeoBundle 'mattn/emmet-vim'
  let g:user_emmet_leader_key='<C-e>'
  let g:user_emmet_settings={ 'lang' : 'ja' }

""" Langages
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'othree/html5.vim'
NeoBundle 'plasticboy/vim-markdown'
  let g:vim_markdown_folding_disabled=1
NeoBundle 'naberon/vim-cakehtml' "For CakePHP
  autocmd BufNewFile,BufRead *.ctp set filetype=htmlcake
NeoBundle 'kchmck/vim-coffee-script'

""" Web
NeoBundle 'mattn/webapi-vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
