" Eric's stuff
" These three lines are so that vim highlights java function definitions
"syn region cppFuncDefLarge start=+\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^(){}]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\s*(+ end=+)+ contains=ALL
"
"syn match cppFuncDefLessLarge "\([A-Za-z0-9_$]*\)\s*(" contained containedin=cppFuncDefLarge contains=ALL
"
"syn match cppFuncDef "\([A-Za-z0-9_$]*\)\s*" contained containedin=cppFuncDefLarge,cppFuncDefLessLarge contains=ALL
"""syn match    cCustomParen    "?=(" contains=cParen,cCppParen
"""syntax match javaMethodDecOuter "\v\w+ \w+" contains=keyword "contains=javaMethodDec
"""syn match    javaMethodDec     "\v\w+" containedin=javaMethodDecOuter
"""
"""syn match    cCustomScope    "::"
"""syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
"""
"hi def link cppFuncDef MethodDeclaration
"""
"hi def MethodDeclaration  gui=bold guifg=yellowgreen
