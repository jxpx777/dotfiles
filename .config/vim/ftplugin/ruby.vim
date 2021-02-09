let g:ruby_path = '~/.rbenv/shims'
" Lint with ale + standardrb
let g:ale_linters = { 'ruby': ['standardrb'] }
let g:ale_fix_on_save = 1
let g:ale_fixers = { 'ruby': ['standardrb'] }
