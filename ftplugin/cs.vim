" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
setlocal completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
"let g:ale_linters = { 'cs': ['OmniSharp'] }

" Update semantic highlighting after all text changes
"let g:OmniSharp_highlight_types = 3

"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" Update semantic highlighting on BufEnter and InsertLeave
" let g:OmniSharp_highlight_types = 2
setlocal omnifunc=OmniSharp#Complete
" Show type information automatically when the cursor stops moving.
" Note that the type is echoed to the Vim command line, and will overwrite
" any other messages in this space including e.g. ALE linting messages.
"autocmd CursorHold *.cs OmniSharpTypeLookup

" The following commands are contextual, based on the cursor position.
nnoremap <buffer> <C-]> :YcmCompleter GoToDefinition<CR>
nnoremap <buffer> gd :YcmCompleter GoToDefinition<CR>
nnoremap <buffer> <Leader>fi :YcmCompleter GoToImplementation<CR>
nnoremap <buffer> <Leader>fs :YcmCompleter GoToSymbol<CR>
nnoremap <buffer> <Leader>gr :YcmCompleter GoToReferences<CR>

" Finds members in the current buffer
"nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

"nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
"nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
nnoremap <buffer> <Leader>dc :YcmCompleter GetDoc<CR>
"nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
"inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

" Navigate up and down by method/property/field
"nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
"nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

" Find all code errors/warnings for the current solution and populate the quickfix window
"nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
"nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
"xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
"command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

"nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
"nnoremap <Leader>ss :OmniSharpStartServer<CR>
"nnoremap <Leader>sp :OmniSharpStopServer<CR>
