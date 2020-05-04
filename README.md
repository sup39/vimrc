# vimrc for sup39
## Description
Well, just a place to put my vimrc,
and to record the evolutionary history of my vimrc.  
Not suitable for others now, but I will try to improve it.

## Installation
### Clone this repo
```sh
git clone https://github.com/sup39/vimrc $HOME/.vim/sup39
```
### Import in your vimrc
In your vimrc:
```vim
" If you want to use vim-plug that I'm using:
" This script will install vim-plug automatically.
" Make sure to source plug.vim BEFORE vimrc
source $HOME/.vim/sup39/plug.vim

" set your `mapleader` and `maplocalleader` here if you want
source $HOME/.vim/sup39/vimrc
" you can override my settings here
```

Alternatively, you can make a activate command to source it manually.
```vim
" In your vimrc
command Sup39Source source $HOME/.vim/sup39/vimrc
" anywhere when you want to activate it
:Sup39Source
" You may need to :e to trigger the autocmd
```

## Reference
Steve Losh (2013) [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com)
