if !filereadable($HOME.'/.vim/autoload/plug.vim')
  echom 'Installing vim-plug...'
  call system('curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs '.
    \'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  source $HOME/.vim/autoload/plug.vim
  echom 'DONE! You may need to :PlugInstall to install listed plugins'
endif

call plug#begin('~/.vim/plugged')
" call plug#end()
