"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
set nocompatible
set clipboard=unnamed
let mapleader=","
set splitright

call plug#begin('~/.local/nvim/plugged')
	" General
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
	" File nav and search
Plug 'universal-ctags/ctags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
	" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
	" Golang
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'
	" Typescript
Plug 'leafgarland/typescript-vim'
	" Formatting
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-syntastic/syntastic'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
	"Ruby, Rails, Sinatra
Plug 'tpope/vim-rails'
call plug#end()

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf
"When vim is resized, equalize the windows. Useful in tmux context
autocmd VimResized * :wincmd =

nmap j gj
nmap k gk
imap jj <esc>

noremap <C-s> <esc>:w<cr>
inoremap <C-s> <esc>:w<cr>

" Tab creation and navigation
nnoremap <leader><tab> :tabnew<cr>
vnoremap <leader><tab> y :tabnew<cr>P

nmap <leader>[ lysiw"ysa"]hx

" Make CtrlP use ag for listing the files. Way faster and no useless files.
" The Silver Searcher
 if executable('ag')
   " Use ag over grep
   	 let g:ackprg = 'ag --vimgrep'
     set grepprg=ag\ --nogroup\ --nocolor\ --path-to-agignore=~/.agignore

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	"ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

filetype off                  " required
filetype plugin indent on    " required

set backspace=indent,eol,start " allow backspacing over everything in insert mode

set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

set relativenumber 
set number

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

syntax on

" Golang specific commands
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" Sane default code indentation
set tabstop=4
set shiftwidth=4

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Shortcut to rapidly toggle `set list`
nmap <leader><space> :set list!<CR>
nnoremap <esc> :noh<return><esc>

set autowrite
set tags=./tags,./.git/tags,tags;

" Syntastic options
let g:syntastic_typescript_tsc_fname = ''
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

let g:neoformat_php_phpcbf = {
      \ 'exe': 'phpcbf',
      \ 'args': [
      \ '--standard=WordPress',
      \ '--extensions=php',
      \ '%',
      \ '||',
      \ 'true'
      \ ],
      \ 'stdin': 1,
      \ 'no_append': 1
      \ }
let g:neoformat_enabled_php = ['phpcbf']

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
