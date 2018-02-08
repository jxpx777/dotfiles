set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.local/nvim/plugged')
Plug 'sebdah/vim-delve'
call plug#end()
