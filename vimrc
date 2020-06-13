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
" file
  " save
  nnoremap <C-S> :w<CR>
  inoremap <C-S> <ESC>:w<CR>
  " copy
  nnoremap <leader>C :w !pbcopy<CR><CR>
  " tab edit
  nnoremap <leader>e :tabe 
  nnoremap <leader>vv :tabe $HOME/.vim/sup39/vimrc<CR>
  nnoremap <leader>vp :tabe $HOME/.vim/sup39/plug.vim<CR>
  nnoremap <leader>vd :tabe $HOME/.vim/sup39/
  nnoremap <leader>V :tabe $MYVIMRC<CR>
" search
nnoremap / /\v
nnoremap ? ?\v
nnoremap <leader>sl :s/\v
nnoremap <leader>se :.,$s/\v
nnoremap <leader>ss :%s/\v
nnoremap <leader>hh :set hlsearch! incsearch!<CR>
nnoremap <leader>hc :nohlsearch<CR>
" ale
nnoremap <leader>r :ALERename<CR>
nnoremap <leader>n :ALENext<CR>
nnoremap <leader>p :ALEPrevious<CR>
nnoremap <leader><space> :ALEHover<CR>
nnoremap <leader>db :ALEGoToDefinition -tab<CR>
nnoremap <leader>dm :ALEGoToDefinition<CR>
nnoremap <leader>dl :ALEDetail<CR>
" external
nnoremap <leader>m :w<CR>:make<CR>
" syntax
nnoremap <leader>S :syntax sync fromstart<CR>
" debug
nnoremap <leader>x :exe getline('.')<CR>
nnoremap <leader>X :exe join(getline('.', '$'), "\n")<CR>
nnoremap <leader>H :echo synIDattr(synID(line("."),col("."),1),"name")<CR>

" filetype-dependent
augroup sup39_auto
  autocmd!
  " vim
    " source
    autocmd Filetype vim noremap <buffer> <localleader>s :w<CR>:so %<CR>
  " c, cpp
    " macro
    autocmd Filetype c,cpp noremap <buffer> <localleader>h 
      \:call setline('.', toupper(substitute(@%, '\.', '_', 'g')))<CR>
      \yyI#ifndef <C-O>p#define <C-O>o<CR><CR><CR>#endif<ESC>kki
    autocmd Filetype c,cpp noremap <buffer> <localleader>i 
      \:call setline('.',
      \'#include "'.substitute(@%, '\.\zsc\ze\(pp\)\?$', 'h', '').'"')<CR>o
    " abbr
    autocmd Filetype c,cpp iabbrev <buffer> #i #include
  " markdown
    " plugin
    autocmd Filetype markdown nnoremap <localleader>p :MarkdownPreview<CR>
  " COMMON
    " disable auto comment prefix
    autocmd Filetype * setlocal formatoptions-=ro
    " keyword
    autocmd Filetype javascript,typescript,vue setlocal iskeyword+=$
    autocmd Filetype html,vue setlocal iskeyword+=-
    " tab
    autocmd FileType make,java,python setlocal noexpandtab
    " syntax sync
    autocmd FileType markdown,vue syntax sync fromstart
augroup END

" basic
filetype on
syntax on
set encoding=utf-8
set backspace=indent,eol,start
set nocompatible
set nofoldenable

" indent
set list listchars=tab:\▸\-
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab smarttab
set autoindent smartindent
let g:vim_indent_cont = 0

" search
set incsearch

" completion
set completeopt=menu,menuone,noselect,noinsert

" status bar
set laststatus=2
set ruler
set wildmenu
