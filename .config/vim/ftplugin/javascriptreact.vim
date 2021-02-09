let g:ale_linters = { 'typescript': [ 'eslint'] }
let g:ale_fixers = {'typescript': ['prettier']}
autocmd BufEnter <buffer> :syntax sync fromstart
autocmd BufLeave <buffer> :syntax sync clear
