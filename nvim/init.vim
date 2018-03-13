"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

call plug#begin('~/.local/nvim/plugged')
Plug 'sebdah/vim-delve'
Plug 'vim-syntastic/syntastic'
Plug 'universal-ctags/ctags'

Plug 'davidoc/taskpaper.vim'

Plug 'chriskempson/base16-vim'

Plug 'rking/ag.vim'

Plug 'vim-scripts/move'

"Javascript
Plug 'pangloss/vim-javascript'

"Typescript
Plug 'leafgarland/typescript-vim'

"ReactJS
Plug 'mxw/vim-jsx'

"JSON
Plug 'elzr/vim-json'

" Ruby and Rails
Plug 'vim-ruby/vim-ruby'

" Tim Pope Joints
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

"Golang
Plug 'fatih/vim-go'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" " Text objects
" Plug 'tommcdo/vim-exchange'
" Plug 'vim-scripts/ReplaceWithRegister'
" Plug 'christoomey/vim-sort-motion'
" Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-entire'
" Plug 'kana/vim-textobj-indent'
" Plug 'kana/vim-textobj-line'
call plug#end()

let g:airline_theme = 'base16-tomorrow'
colorscheme base16-tomorrow
set termguicolors
