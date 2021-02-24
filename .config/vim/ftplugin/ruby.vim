let g:ruby_path = '~/.rbenv/shims'

" Lint with ale + standardrb
let g:ale_linters = { 'ruby': ['standardrb'] }
let g:ale_fixers = { 'ruby': ['standardrb'] }
