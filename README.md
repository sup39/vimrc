# vimrc for sup39
## Description
Well, just a place to put my vimrc,
and to record the evolutionary history of my vimrc.  
Not suitable for others now, but I will try to improve it.

## Installation
### Install [vim-plug](https://github.com/junegunn/vim-plug)
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
### Clone this repo
```sh
git clone https://github.com/sup39/vimrc $HOME/.vim/sup39
```
### Import in your vimrc
You can simply use it.
```vim
" In your vimrc
" set your `mapleader` and `maplocalleader` here if you want
source $HOME/.vim/sup39/sup39.vimrc
" you can override my settings here
```
Or maybe make a Activate Command.
```vim
" In your vimrc
command Sup39Source source $HOME/.vim/sup39/sup39.vimrc
" anywhere when you want to activate it
:Sup39Source
" You may need to :e to trigger the autocmd
```

## Reference
Steve Losh (2013) [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com)
