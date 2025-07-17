let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint', 'prettier']
let b:ale_completion_autoimport = 1
autocmd BufEnter <buffer> :syntax sync fromstart
autocmd BufLeave <buffer> :syntax sync clear
