inoremap <buffer> <c-s> <Esc>:update<CR> !silent :!pdflatex --shell-escape % <CR>
noremap <buffer> <c-s> :update<CR>:!pdflatex --shell-escape % <CR>
vnoremap <buffer> <C-S> <C-C>:update<CR>!pdflatex --shell-escape % <CR>
