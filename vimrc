"{{{ Plugins
"{{{ Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'mileszs/ack.vim'
"Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'ervandew/supertab'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
"Plugin 'AndrewRadev/undoquit.vim'
" Colorschemes
"Plugin 'blueshirts/darcula'
"Plugin 'sjl/badwolf'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'lifepillar/vim-solarized8'
Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'tikhomirov/vim-glsl'
"Plugin 'vim-scripts/ShaderHighLight'
"Plugin 'w0rp/ale'
"Plugin 'm-pilia/vim-ccls'
"Plugin 'skywind3000/vim-preview'
"Plugin 'gcmt/taboo.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'tommcdo/vim-exchange'
"Plugin 'OmniSharp/omnisharp-vim'
"Plugin 'OrangeT/vim-csharp'

if !has("terminal")
    Plugin 'vim-scripts/Conque-GDB'
endif

call vundle#end()            " required
filetype plugin indent on    " required
"}}}

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
let g:NERDTreeHijackNetrw = 0

let NERDTreeIgnore = ['\.pyc$','\.o$']
let NERDTreeMinimalUI = 1
let NERDTreeMapJumpNextSibling = '\<C-J>'
let NERDTreeMapJumpPrevSibling = '\<C-K>'
let g:NERDTreeQuitOnOpen = 1

"Youcompleteme fix
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_cpp_check_header = 1

"Makes ctrlp ignore filetypes in the .gitignore, also makes it open faster
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 0

let g:ackprg = 'ag --vimgrep'

"let g:ale_cpp_clangtidy_checks = ['*', '-cppcoreguidelines-pro-bounds-pointer-arithmetic']
"let g:ale_enabled = 1

"let g:OmniSharp_server_stdio = 1
"let g:OmniSharp_highlighting = 0

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

set sessionoptions=blank,curdir,folds,help,tabpages,terminal,winsize

"nnoremap <C-]> :ALEGoToDefinition<CR>
"nnoremap <C-W><C-]> :ALEGoToDefinitionInSplit<CR>
"nnoremap <C-W>] :ALEGoToDefinitionInSplit<CR>

if has("terminal")
    packadd termdebug
    nnoremap \b :Break<CR>
    nnoremap \c :Clear<CR>
    nnoremap \p :Evaluate<CR>
    nnoremap \s :Step<CR>
    nnoremap \n :Over<CR>
    nnoremap \d :call term_sendkeys("!gdb", "delete\<lt>CR>y\<lt>CR>")<CR>
else
    let g:ConqueGdb_Leader = '\'
    nnoremap \d :ConqueGdbCommand delete<CR>
endif

"}}}
"{{{ Basic Settings
filetype plugin on 	"enables different vimrc's for different filetypes
syntax enable

colorscheme PaperColor
set background=dark
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent

set nonumber 			" don't show line numbers
set noshowmatch 		" shows the match for ({[]})
set incsearch 		" search as characters are entered
set hlsearch 		" highlight matches
set autoindent
set linebreak 		"makes the lines break at spaces when it wraps
set mouse=nv 		"allows use of mouse in normal and visual mode (not insert mode)
set wildmenu		"shows a visual menu for tab completion
set lazyredraw      "speeds up macros by not redrawing the screen during them
"set termguicolors   "lets the terminal use truecolor (16 million colors)
set foldenable
set foldmethod=indent
"set foldmethod=marker
set foldlevel=500
set foldnestmax=1
"set cursorline      "Shows a visual horizontal line where the cursor is

set ignorecase
set smartcase
set virtualedit=block
set synmaxcol=1000

"}}}
"{{{ Key Remaps
let mapleader = "\<Space>"

" allows the cursor to move through wrapped lines elegantly
nnoremap j gj
nnoremap k gk


" Allows for moving between window splits with Ctrl-<direction>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Compile using the makefile when F5 is pressed
map <F4> :wa<CR> :!clear; make all<CR>
map <C-4> :wa<CR> :!clear; make all<CR>
" Run tests when F5 is pressed
map <F5> :wa<CR> :!clear; make test<CR>
map <C-5> :wa<CR> :!clear; make test<CR>

" Allows for Ctrl-/ to comment out lines
inoremap <C-_> <C-o>:call nerdcommenter#Comment(0,"toggle")<C-m>
vnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<C-m>
nnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<C-m>

" Autocomplete brackets
inoremap {<CR> {<CR>}<Esc>ko
    

" Copying and pasting from the system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" If vim lacks proper clipboard support, this is very useful.
nnoremap <Leader><Leader>p :call PrintRegisterForCopying()<CR>
" Copies the file name and line number into the clipboard
nnoremap <Leader><Leader>gF :let @"=join([expand('%'),  line(".")], ':')<CR>
" Convenient way to exit insert mode
"inoremap jk <Esc>
"inoremap kj <Esc>



command MakeTags :!ctags -R .

" So that I can q and wq without worrying if the shift is held
command W w
command Wq wq
command Q q
command WQ wq

command DeleteHiddenBuffers call DeleteHiddenBuffers()

" Open nerd tree command
nnoremap <Leader>t :NERDTreeToggle<CR>

nnoremap , za

command SudoWrite w !sudo tee > /dev/null %

" Makes <Leader>h switch between .cpp and .h files
nnoremap <Leader>h :update<CR>:e %:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,:s,.frag$,.X123X,:s,.vert$,.frag,:s,.X123X$,.vert,<CR><space>

" Faster scrolling
nnoremap ) 5<C-e>
nnoremap ( 5<C-y>
vnoremap ) 5<C-e>
vnoremap ( 5<C-y>

" Unmap these because these shortcuts are scary
nnoremap ZZ <nop>
nnoremap ZQ <nop>

" Removes the error list
"nnoremap <Leader>r :SyntasticReset<CR>
nnoremap <Leader>r :ALEToggle<CR>

nnoremap <Leader><Leader>r :redraw!<CR>

" Allows for pressing Ctrl-D for toggling between vim and the terminal
nnoremap <C-D> :sh<CR>

nnoremap <C-I> <C-I>zz
nnoremap <C-O> <C-O>zz
"nnoremap <C-]> <C-]>zz
nnoremap <C-T> <C-T>zz

"""""""" Window stuff
if has("terminal")
    tnoremap <C-W>gt <C-W>:tabn<CR>
    tnoremap <C-W>gT <C-W>:tabp<CR>
    tnoremap <C-J> <C-W><C-J>
    tnoremap <C-K> <C-W><C-K>
    tnoremap <C-L> <C-W><C-L>
    tnoremap <C-W><C-J> <C-J>
    tnoremap <C-W><C-K> <C-K>
    tnoremap <C-W><C-L> <C-L>
	tnoremap <C-W>( <C-W>N5<C-Y>
	tnoremap <C-W>) <C-W>N5<C-E>
    nnoremap <C-W>d :Termdebug<CR>
	autocmd TerminalOpen * setlocal nonumber
else
    nnoremap <C-W>d :ConqueGdb bash<CR>
endif

nnoremap <C-W>gt :call MoveToNextTab()<CR>
nnoremap <C-W>gT :call MoveToPrevTab()<CR>

nnoremap <leader>w :call SyncTree()<CR>

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

command! AddIncludeGuards :normal! mmggO#ifndef <Esc>:put =expand('%{@%}')<CR>:s/\V\/\|./_/g<CR>VUo<Esc>kyypkkJo#define <Esc>JGo<CR>#endif<Esc>'mzz

"}}}
"{{{ Other
" Makes Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" allows for truecolor
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif


" Automatically loads a template when creating a new file
au BufNewFile * silent! 0r ~/.vim/skeleton/template.%:e

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

"}}}
"{{{ Filetypes
augroup filetypedetect
    au BufRead,BufNewFile *.frag set filetype=glsl
    au BufRead,BufNewFile *.vert set filetype=glsl
augroup END
"}}}
"{{{Statusline
set noruler
set laststatus=2
" Syntastic settings
"set statusline=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"set statusline+=%t
"File path relative to current working directory
set statusline=%{@%}
set statusline+=%m
" The file encoding
"set statusline+=[%{&ff}]
set statusline+=%=
" The number of lines in the file
set statusline+=%l/
set statusline+=%L
"  The length of the current line
"set statusline+=\ [%02{strwidth(getline('.'))}]
set statusline+=\ %3p%%\ 

"}}}
"{{{Functions

function PrintRegisterForCopying()
	silent execute "!clear"
	silent execute "!clear"
	echo "@".getcmdline()
	execute "call EchoStr(@".nr2char(getchar()).")"
endfunction

function EchoStr(str)
	execute "!echo " . shellescape(a:str, 1)
endfunction

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! SyncTree()
  if &modifiable
    NERDTreeFind
    wincmd p
  endif
endfunction

function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function RunCommandInExistingShell(command_text)
    if has("terminal")
        let terminal_buffer_escaped = "\!/bin/bash"
        if bufwinnr(terminal_buffer_escaped) == -1
            normal :terminal
        endif
        call term_sendkeys("\!/bin/bash", a:command_text)
    else
        let open_terminal_cmd = ":ConqueTermSplit bash\<CR>"
        let terminal_buffer = "bash - 1"
        let terminal_buffer_escaped = "bash\ -\ 1"

        if !bufexists("bash - 1")
            call feedkeys(open_terminal_cmd . "\<Esc>:q\<CR>")
        endif

        call feedkeys("\<C-W>s\<Esc>:buffer " . terminal_buffer_escaped . "\<CR>ii\<C-U>" . a:command_text . "\<CR>\<Esc>:q\<CR>")
    endif
    "call feedkeys(":windo if expand('%')=='" . terminal_buffer . "'| throw 'stop' | call feedkeys('') | endif\<CR>")
    "call feedkeys(":windo if expand('%')=='bash - 1'| call feedkeys('i') | throw 'error' |  endif\<CR>")
endfunc

function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

"}}}
"{{{ Unused shortcuts
" <Leader>s saves session
"noremap <Leader>s :wa<CR>:mks!<CR>

" Makes a double space clear highlight
"nnoremap <Leader><Space> :noh<CR>

" so that you can press tab in visual mode, and it will indent all highlighted
" lines
"vnoremap <Tab> >gv
"vnoremap <S-Tab> <gv

"makes Ctrl-S save
"inoremap <C-S> <Esc>:update<CR>
"noremap <C-S> :update<CR>
"vnoremap <C-S> <C-C>:update<CR>

"nnoremap <C-W>b :terminal<CR><C-W>L<C-W>N
"nnoremap <C-W><C-b> :terminal<CR><C-W>L<C-W>N

"nnoremap <C-W>D :ConqueGdb<CR><Esc><C-W>J<C-W>500-<C-W>5+:set wfh<CR>i

"inoremap <C-W>q <esc><C-W>q
"inoremap <C-W><C-Q> <esc><C-W>q

" Fugitive statusline
"set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" Makes tab and shft tab go to next and previos tab, respectively
"nnoremap <Tab> gt
"nnoremap <S-Tab> gT


" Makes ctrl-f run a project-wide search
" nnoremap <C-F> :terminal<CR><C-W>Jag --vimgrep 

" Makes it so that vim doesn't delete tabs created by autoindent on empty
" lines. This works by typing a character and then deleting it, which forces
" the autoindenter to put in all the tabs
"inoremap <CR> <CR>x<BS>
"nnoremap o ox<BS>
"nnoremap O Ox<BS>
"nnoremap S Sx<BS>
"inoremap {<CR> {<CR>}<Esc>kox<BS>

"set scrolloff=3		"leaves 3 lines between cursor and end of screen
"}}}
