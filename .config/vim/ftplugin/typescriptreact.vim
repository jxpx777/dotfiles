let b:ale_linters = ['standard']
let b:ale_fixers = ['prettier_standard']
let b:ale_completion_autoimport = 1
autocmd BufEnter <buffer> :syntax sync fromstart
autocmd BufLeave <buffer> :syntax sync clear
