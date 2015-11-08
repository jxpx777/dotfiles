if exists("did_load_filetypes")
	finish
endif

"
"JSON
"
au! BufRead,BufNewFile *.json set filetype=json
"au FileType json setlocal equalprg=python\ -m\ json.tool

augroup json_autocmd
	autocmd!
	autocmd FileType json set autoindent
	autocmd FileType json set formatoptions=tcq2l
	autocmd FileType json set textwidth=78 shiftwidth=2
	autocmd FileType json set softtabstop=4 tabstop=8
	autocmd FileType json set foldmethod=syntax
augroup END

" - Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" - ReactJS
au! BufRead,BufNewFile *.react.ts set filetype=typescript
au! BufRead,BufNewFile *.react.js set filetype=javascript

"
" TODO: 
" - Rakefile?
