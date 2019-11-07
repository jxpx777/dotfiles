setlocal formatoptions=tcqlw1
setlocal textwidth=78 shiftwidth=4
setlocal softtabstop=4 tabstop=4
setlocal expandtab
setlocal makeprg=open\ -a\ Marked\\\ 2.app\ '%:p'

set nofoldenable
<<<<<<<< HEAD:.config/vim/ftplugin/markdown.vim
let b:markdown_fenced_languages = ['html', 'ruby', 'javascript', 'go', 'python', 'bash=sh', 'zsh']
let b:vim_markdown_frontmatter=1

" autocmd BufWritePre * :call markdownlint.fixAll()
========
let g:markdown_fenced_languages = ['html', 'ruby', 'javascript', 'go', 'python', 'bash=sh', 'zsh']
let g:vim_markdown_frontmatter=1
>>>>>>>> 7718d6e7 (Update Markdown handling):vim/ftplugin/markdown.vim
