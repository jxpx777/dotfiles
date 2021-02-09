let g:ale_linters = { 
			\ 'typescript': [ 'eslint'],
			\ 'typescriptreact': [ 'eslint']
			\}
let g:ale_fixers = {
			\	'typescript': ['prettier'],
			\ 'typescriptreact': ['prettier']
			\}
let g:ale_completion_autoimport = 1
