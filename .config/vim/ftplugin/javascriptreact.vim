let g:ale_linters = { 'typescript': [ 'standard'] }
let g:ale_fixers = {'typescript': ['prettier_standard']}
autocmd BufEnter <buffer> :syntax sync fromstart
autocmd BufLeave <buffer> :syntax sync clear
