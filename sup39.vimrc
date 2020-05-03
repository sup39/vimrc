" map-leader
if !exists('mapleader')
  let mapleader='q'
  nnoremap q <nop>
  nnoremap Q q
endif
if !exists('maplocalleader')
  let maplocalleader='qw'
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
  nnoremap <leader>v :tabe $HOME/.vim/sup39/sup39.vimrc<CR>
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
" debug
nnoremap <leader>X :exe getline('.')<CR>
nnoremap <leader>H :echo synIDattr(synID(line("."),col("."),1),"name")<CR>

" filetype-dependent
augroup sup39_map
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
    nnoremap <localleader>p :MarkdownPreview<CR>
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

" completion
set completeopt=menu,menuone,popup,noselect,noinsert


" plugin
call plug#begin('~/.vim/plugged')
  " basic
  Plug 'tpope/vim-sensible'

  " markdown syntax
  Plug 'plasticboy/vim-markdown'
  let g:vim_markdown_new_list_item_indent = 0
  let g:vim_markdown_math = 1

  " markdown preview
  Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
  let g:mkdp_auto_start = 0
  let g:mkdp_auto_close = 0
  let g:mkdp_preview_options = {
  \  'katex': {
  \    'macros': {
  \      '\s': '\square',
  \    },
  \  },
  \}

  " ale
  Plug 'dense-analysis/ale'
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'
  let g:ale_sign_column_always = 1
  let g:ale_completion_enabled = 1
  let g:ale_linters = {
  \   'cpp': ['gcc'],
  \   'swift': ['sourcekitlsp'],
  \ }
call plug#end()

" override
augroup sup39_override
  autocmd!
  " override plugin
  autocmd Filetype * setlocal formatoptions-=ro
  " keyword
  autocmd Filetype javascript,typescript,vue setlocal iskeyword+=$
  autocmd Filetype html,vue setlocal iskeyword+=-
  " tab
  autocmd FileType make,java,python setlocal noexpandtab
  " syntax
  autocmd FileType markdown,vue syntax sync fromstart
augroup END
