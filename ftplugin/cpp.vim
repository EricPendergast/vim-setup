" Make f6 do a single file compile and run
nnoremap <buffer> <f6> :!g++ -std=c++17 -g3 -Wconversion -Wall -Wextra -pedantic %<CR>:!./a.out<CR>
"let g:syntastic_cpp_compiler = "g++"
"let g:syntastic_cpp_compiler_options = "-std=c++17 -g3 -Wconversion -Wall -Wextra -pedantic"

syn match semicolonComma "\v[;,]" containedin=ALLBUT,Comment
hi def link semicolonComma Keyword

setlocal keywordprg=cppman

setlocal foldmethod=syntax
