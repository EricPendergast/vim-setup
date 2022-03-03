" Make f6 do a single file compile and run
nnoremap <buffer> <f6> :!gcc %<CR>:!./a.out<CR>
syn match semicolonComma "\v[;,]" containedin=ALLBUT,Comment
hi def link semicolonComma Keyword

setlocal keywordprg=cppman

setlocal foldmethod=syntax
