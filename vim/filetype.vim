if exists("did_load_filetypes")
	finish
endif

" - markdown
autocmd bufnewfile,bufreadpost *.md set filetype=markdown

" - reactjs
au! bufread,bufnewfile *.react.ts set filetype=typescript
au! bufread,bufnewfile *.react.js set filetype=javascript

""json
au! bufread,bufnewfile *.json set filetype=json
au filetype json setlocal equalprg=python\ -m\ json.tool

" TODO: 
" - Rakefile?
