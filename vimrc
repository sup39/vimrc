let sfile = expand('<sfile>')

" map-leader
if !exists('mapleader')
  let mapleader='q'
  nnoremap <leader> <nop>
  nnoremap Q q
endif
if !exists('maplocalleader')
  let maplocalleader='qw'
  noremap <localleader> <nop>
endif
inoremap jk <ESC>
inoremap JK <ESC>
" file
  " save
  nnoremap <C-S> :w<CR>
  inoremap <C-S> <ESC>:w<CR>
  " copy
  nnoremap <leader>C :%y*<CR>
  " tab edit
  nnoremap <leader>e :tabe 
  execute 'nnoremap <leader>vv :tabe '.sfile.'<CR>'
  nnoremap <leader>V :tabe $MYVIMRC<CR>
" search
nnoremap / /\v
nnoremap ? ?\v
nnoremap <leader>hh :set hlsearch! incsearch!<CR>
nnoremap <leader>hc :nohlsearch<CR>
" external
nnoremap <leader>m :w<CR>:!make<CR>
" syntax
nnoremap <leader>S :syntax sync fromstart<CR>
" debug
nnoremap <leader>H :echo synIDattr(synID(line("."),col("."),1),"name")<CR>

" filetype-dependent
augroup sup39_auto
  autocmd!
  " vim
    autocmd Filetype vim noremap <buffer> <localleader>s :w<CR>:so %<CR>
  " keyword
    autocmd Filetype javascript,typescript,vue setlocal iskeyword+=$
    autocmd Filetype html,vue setlocal iskeyword+=-
  " tab
    autocmd FileType make,java,python setlocal noexpandtab
augroup END

" basic
filetype on
syntax on
set encoding=utf-8
set backspace=indent,eol,start
set nocompatible
set nofoldenable
set background=dark
set nostartofline

" indent
set list listchars=tab:▸-,trail:･
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab smarttab
set autoindent smartindent
if !exists('g:vim_indent_cont') | let g:vim_indent_cont = 0 | endif

" search
set incsearch

" status bar
set laststatus=2
set ruler
set wildmenu
set showcmd " pending command
