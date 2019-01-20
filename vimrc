"{{{ Plugins
"{{{ Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'AndrewRadev/undoquit.vim'
" Colorschemes
Plugin 'blueshirts/darcula'
Plugin 'sjl/badwolf'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lifepillar/vim-solarized8'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tikhomirov/vim-glsl'

call vundle#end()            " required
filetype plugin indent on    " required
"}}}

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

let NERDTreeIgnore = ['\.pyc$','\.o$']
let NERDTreeMinimalUI = 1
let NERDTreeMapJumpLastChild = '\J'
let NERDTreeMapJumpFirstChild = '\K'
let NERDTreeMapJumpNextSibling = '\<C-J>'
let NERDTreeMapJumpPrevSibling = '\<C-K>'

"Youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

"Makes ctrlp ignore filetypes in the .gitignore, also makes it open faster
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_by_filename = 1

let g:ackprg = 'ag --vimgrep'

cnoreabbrev Ack Ack!

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

set number 			" show line numbers
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
set foldmethod=marker
set foldlevel=500
set foldnestmax=1
set cursorline      "Shows a visual horizontal line where the cursor is

set ignorecase
set smartcase
set virtualedit=block
set synmaxcol=200

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
inoremap <C-_> <C-o>:call NERDComment(0,"toggle")<C-m>
vnoremap <C-_> :call NERDComment(0,"toggle")<C-m>
nnoremap <C-_> :call NERDComment(0,"toggle")<C-m>

" Autocomplete brackets
inoremap {<CR> {<CR>}<Esc>ko
    

" Copying and pasting from the system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Convenient way to exit insert mode
inoremap jk <Esc>
inoremap kj <Esc>

command MakeTags :terminal ++close ctags -R .

" So that I can q and wq without worrying if the shift is held
command W w
command Wq wq
command Q q
command WQ wq

" Open nerd tree command
nnoremap <Leader>t :NERDTreeTabsToggle<CR>

nnoremap , za

" Makes 'w!!' write even if vim wasn't run as sudo
cmap w!! w !sudo tee > /dev/null %

" Makes <Leader>h switch between .cpp and .h files
nnoremap <Leader>h :update<CR>:e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,:s,.frag$,.X123X,:s,.vert$,.frag,:s,.X123X$,.vert,<CR>

" Faster scrolling
nnoremap ) 5<C-e>
nnoremap ( 5<C-y>
" For training
nnoremap J <nop>
nnoremap K <nop>

" Unmap these because these shortcuts are scary
nnoremap ZZ <nop>
nnoremap ZQ <nop>

" Removes the error list
nnoremap <Leader>r :SyntasticReset<CR>

" Allows for pressing Ctrl-D for toggling between vim and the terminal
nnoremap <C-D> :sh<CR>

" Since C-I is the same as tab (which is used elsewhere), C-Y is used as a
" substitute keymapping
nnoremap <C-Y> <C-I>zz
nnoremap <C-O> <C-O>zz
nnoremap <C-]> <C-]>zz
nnoremap <C-T> <C-T>zz

"""""""" Window stuff
tnoremap <Esc> <C-W>N

nnoremap <C-W>gt :call MoveToNextTab()<CR>
nnoremap <C-W>gT :call MoveToPrevTab()<CR>

nnoremap <leader>w :call SyncTree()<CR>

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

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
autocmd Filetype java call SetJavaOptions()
function SetJavaOptions()
    " This is because I like semicolons and commas to be highlighted a
    " different color. I made the highlight color be that of keywords because
    " most colorschemes have brightly colored keywords
    syn match semicolonComma "\v[;,]" containedin=ALLBUT,Comment
    hi def link semicolonComma Keyword
    
    set foldmethod=syntax
endfunction

autocmd Filetype cpp call SetCppOptions()
function SetCppOptions()
    " Make f6 do a single file compile and run
    nnoremap <f6> :!g++ -std=c++17 -g3 -Wconversion -Wall -Wextra -pedantic %<CR>:!./a.out<CR>
    let g:syntastic_cpp_compiler = "g++"
    let g:syntastic_cpp_compiler_options = "-std=c++17 -g3 -Wconversion -Wall -Wextra -pedantic"
    
    syn match semicolonComma "\v[;,]" containedin=ALLBUT,Comment
    hi def link semicolonComma Keyword
    
    set keywordprg=cppman
    
    set foldmethod=syntax
endfunction


autocmd Filetype python call SetPythonOptions()
function SetPythonOptions()
    nnoremap <f6> :terminal python3.6 %<CR>
    syn match semicolonComma "\v[;,]"
    hi def link semicolonComma Keyword
    
    set foldmethod=indent
    set foldnestmax=2
    
endfunction

autocmd Filetype c call SetCOptions()
function SetCOptions()
    " Make f6 do a single file compile and run
    nnoremap <f6> :!gcc %<CR>:!./a.out<CR>
    syn match semicolonComma "\v[;,]" containedin=ALLBUT,Comment
    hi def link semicolonComma Keyword
    
    set keywordprg=cppman
    
    set foldmethod=syntax
endfunction


augroup filetypedetect
    au BufRead,BufNewFile *.frag set filetype=glsl
    au BufRead,BufNewFile *.vert set filetype=glsl
augroup END
"}}}
"{{{Statusline
set noruler
set laststatus=2
" Syntastic settings
set statusline=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"set statusline+=%t
"File path relative to current working directory
set statusline+=%{@%}
set statusline+=%m
" The file encoding
"set statusline+=[%{&ff}]
" The number of lines in the file
"set statusline+=%=%LL
"  The length of the current line
set statusline+=%=
"set statusline+=\ [%02{strwidth(getline('.'))}]
set statusline+=\ %3p%%\ 

"}}}
"{{{Functions
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
