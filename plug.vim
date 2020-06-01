if !filereadable($HOME.'/.vim/autoload/plug.vim')
  echom 'Installing vim-plug...'
  call system('curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs '.
    \'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  source $HOME/.vim/autoload/plug.vim
  echom 'DONE! You may need to :PlugInstall to install listed plugins'
endif

" plugin
call plug#begin('~/.vim/plugged')
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
