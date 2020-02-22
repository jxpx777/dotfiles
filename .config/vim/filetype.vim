if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
" - markdown
autocmd bufnewfile,bufreadpost *.md set filetype=markdown
autocmd bufnewfile,bufreadpost *.markdown set filetype=markdown
autocmd bufnewfile,bufreadpost *.mdown set filetype=markdown

" - reactjs
au! bufread,bufnewfile *.react.ts set filetype=typescript
au! bufread,bufnewfile *.react.js set filetype=javascript

""json
au! bufread,bufnewfile *.json set filetype=json

au! bufread,bufnewfile Rakefile set filetype=ruby
au! bufread,bufnewfile *.rake set filetype=ruby
au! bufread,bufnewfile *.task set filetype=ruby

augroup END
