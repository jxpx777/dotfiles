setlocal expandtab tabstop=2

" Lint with ale + standardrb
let b:ale_linters = ['rubocop']
let g:ale_fix_on_save = 1
let b:ale_fixers = ['rubocop']
