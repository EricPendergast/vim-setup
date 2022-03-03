" This is because I like semicolons and commas to be highlighted a
" different color. I made the highlight color be that of keywords because
" most colorschemes have brightly colored keywords
syn match semicolonComma "\v[;,]" containedin=ALLBUT,Comment
hi def link semicolonComma Keyword

set foldmethod=syntax
