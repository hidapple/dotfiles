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
set clipboard=unnamed
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
  nmap <Leader>c <Plug>(caw:i:toggle)
  vmap <Leader>c <Plug>(caw:i:toggle)
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

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

""" Neocomplete
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
NeoBundle 'slim-template/vim-slim.git'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'othree/html5.vim'
NeoBundle 'plasticboy/vim-markdown'
  let g:vim_markdown_folding_disabled=1
NeoBundle 'naberon/vim-cakehtml' "For CakePHP
  autocmd BufNewFile,BufRead *.ctp set filetype=htmlcake

""" Web
NeoBundle 'mattn/webapi-vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)

""" Latex
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
  set shellslash
  set grepprg=grep\ -nH\ $*
  let g:tex_flavor='latex'
  let g:Imap_UsePlaceHolders = 1
  let g:Imap_DeleteEmptyPlaceHolders = 1
  let g:Imap_StickyPlaceHolders = 0
  let g:Tex_DefaultTargetFormat = 'pdf'
  let g:Tex_MultipleCompileFormats='dvi,pdf'
  let g:Tex_FormatDependency_pdf = 'dvi,pdf'
  let g:Tex_FormatDependency_ps = 'dvi,ps'
  let g:Tex_CompileRule_pdf = '/usr/texbin/ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
  let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -o $*.ps $*.dvi'
  let g:Tex_CompileRule_dvi = '/usr/texbin/uplatex -synctex=1-interaction=nonstopmode -file-line-error-style $*'
  let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
  " let g:Tex_BibtexFlavor = '/usr/texbin/pbibtex'
  let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex -U $*.idx'
  let g:Tex_UseEditorSettingInDVIViewer = 1
  let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
  let g:Tex_AutoFolding = 0
  let g:Tex_SmartKeyQuote = 0
  let g:Tex_IgnoreLevel = 9 
  let g:Tex_IgnoredWarnings = 
      \"Underfull\n".
      \"Overfull\n".
      \"specifier changed to\n".
      \"You have requested\n".
      \"Missing number, treated as zero.\n".
      \"There were undefined references\n".
      \"Citation %.%# undefined\n".
      \"LaTeX Font Warning: Font shape `%s' undefined\n".
      \"LaTeX Font Warning: Some font shapes were not available, defaults substituted."

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
