" .vimrc for everyone
" Maintainer: Nhat Tran<tranminhnhat2311@gmail.com>
" Version:    1.2



" Fundamentals "{{{
" ---------------------------------------------------------------------
" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

"line number
set number
set relativenumber
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set foldenable
set foldmethod=marker
set foldmarker={{{,}}}
set nocursorline
set showmatch				" Show matching brackets.
set linebreak
set ignorecase				" Do case insensitive matching
set smartcase				" Do smart case matchingf
set showcmd

" show whitespace
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" Highlight Whitespaces
highlight Whitespace ctermfg=Grey
" Makes comments italic
highlight Comment cterm=italic
" set indent base on file type
filetype indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" remove auto indent for python and yaml file
set indentkeys-=0#
" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Don't redraw while executing macros (good performance config)
set lazyredraw
" Copy to clipboard
set clipboard+=unnamedplus
" Autocomplete with dictionary words when spell check is on
set complete+=kspell

"use jj for exit insert mode
inoremap jj <Esc>


" Use tab with virtual mode
vmap <Tab> >gv
vmap <S-Tab> <gv
"}}}



"  NEOVIM CONFIG{{{
" ---------------------------------------------------------------------
if has('nvim')

  " File types "{{{
  " ---------------------------------------------------------------------
  " JavaScript
  au BufNewFile,BufRead *.es6 setf javascript
  " TypeScript
  au BufNewFile,BufRead *.tsx setf typescriptreact
  " Markdown
  au BufNewFile,BufRead *.md set filetype=markdown
  au BufNewFile,BufRead *.mdx set filetype=markdown
  " Flow
  au BufNewFile,BufRead *.flow set filetype=javascript
  " Fish
  au BufNewFile,BufRead *.fish set filetype=fish

  set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

  autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
	autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
	autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
	" Auto close tag
	let g:closetag_filenames = '*.html,*.js,*.jsx,*.vue'
	let g:closetag_emptyTags_caseSensitive = 1
	let g:jsx_ext_required = 0

  au BufRead,BufNewFile .eslintrc.json setlocal filetype=json
  au BufRead,BufNewFile .babelrc setlocal filetype=json
  au BufRead,BufNewFile .prettierrc setlocal filetype=json

  au BufRead,BufNewFile .babelrc.js setlocal filetype=javascript
  au BufRead,BufNewFile .sequelizerc setlocal filetype=javascript
  au BufRead,BufNewFile *.hbs setlocal filetype=html
  autocmd BufNewFile,BufReadPost * if &filetype == "python" | set indentkeys-=0# | endif
  autocmd BufNewFile,BufReadPost * if &filetype == "yaml" | set expandtab shiftwidth=2 indentkeys-=0# | endif

  "}}}


  " Imports "{{{
  " ---------------------------------------------------------------------
  runtime ./plug.vim
  if has("unix")
    let s:uname = system("uname -s")
  endif
	" true color
	syntax enable
	set termguicolors
	set winblend=0
	set wildoptions=pum
	set pumblend=5
	set background=dark
	colorscheme dracula

  runtime ./maps.vim
endif
  "}}}
