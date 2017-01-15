" Eric's stuff
" These three lines are so that vim highlights java function definitions
syn region javaFuncDefLarge start=+^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)\s\+\)*\(<.*>\s\+\)\?\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^(){}]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\s*(+ end=+)+ contains=javaScopeDecl,javaType,javaStorageClass,javaComment,javaLineComment,@javaClasses,javaAnnotation,javaFuncDefLessLarge

syn match javaFuncDefLessLarge "\([A-Za-z0-9_$]*\)\s*(" contained containedin=javaFuncDefLarge contains=javaScopeDecl,javaType,javaStorageClass,javaComment,javaLineComment,@javaClasses,javaAnnotation,javaFuncDef

syn match javaFuncDef "\([A-Za-z0-9_$]*\)\s*" contained containedin=javaFuncDefLessLarge contains=javaScopeDecl,javaType,javaStorageClass,javaComment,javaLineComment,@javaClasses,javaAnnotation

"syn match thing "\v[;,]" containedin=ALLBUT,Comment
"hi def link thing Keyword
  "syn match    cCustomParen    "?=(" contains=cParen,cCppParen
"syntax match javaMethodDecOuter "\v\w+ \w+" contains=keyword "contains=javaMethodDec
"syn match    javaMethodDec     "\v\w+" containedin=javaMethodDecOuter
"
"syn match    cCustomScope    "::"
"syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
"
hi def link javaFuncDef FunctionDeclaration
"
"hi def MethodDeclaration  gui=bold guifg=yellowgreen
