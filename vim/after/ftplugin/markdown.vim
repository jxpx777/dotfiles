setlocal formatoptions=tcqlw1
setlocal textwidth=78 shiftwidth=4
setlocal softtabstop=4 tabstop=4
setlocal expandtab
setlocal makeprg=open\ -a\ Marked\\\ 2.app\ '%:p'

let g:vim_markdown_folding_disabled=1
let g:markdown_fenced_languages = ['html', 'ruby', 'javascript', 'go', 'python', 'bash=sh', 'zsh']
let g:vim_markdown_frontmatter=1

autocmd Goyo
