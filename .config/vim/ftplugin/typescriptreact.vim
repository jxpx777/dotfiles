let g:ale_linters = { 'typescript': [ 'eslint'] }
let g:ale_fixers = {'typescript': ['prettier']}
let g:ale_completion_autoimport = 1
autocmd BufEnter <buffer> :syntax sync fromstart
autocmd BufLeave <buffer> :syntax sync clear
