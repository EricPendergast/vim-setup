"{{{ Plugins
"""" This is for vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" For searching
Plugin 'mileszs/ack.vim'
" Highlights errors
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/Conque-GDB'
" Colorschemes
Plugin 'blueshirts/darcula'
Plugin 'sjl/badwolf'
Plugin 'dracula/vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'
Plugin 'lifepillar/vim-solarized8'
Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'kana/vim-submode'

call vundle#end()            " required
filetype plugin indent on    " required
""""
"""" Plugins
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"Youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:ConqueGdb_Leader = '\'
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly

let NERDTreeIgnore = ['\.pyc$', '__init__\.py']

"Makes ctrlp ignore filetypes in the .gitignore, also makes it open faster
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
"}}}
"{{{ Basic Settings
filetype plugin on 	"enables different vimrc's for different filetypes
syntax enable

"colorscheme darcula
"colorscheme badwolf
colorscheme PaperColor
set background=dark
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent

set number 			" show line numbers
set noshowmatch 		" shows the match for ({[]})
"let g:loaded_matchparen=1 "disables highlighting of matching parenthesis
set incsearch 		" search as characters are entered
set hlsearch 		" highlight matches
set autoindent
set linebreak 		"makes the lines break at spaces when it wraps
set mouse=nv 		"allows use of mouse in normal and visual mode (not insert mode)
set wildmenu		"shows a visual menu for tab completion
set lazyredraw      "speeds up macros by not redrawing the screen during them
"set termguicolors   "lets the terminal use truecolor (16 million colors)
"set scrolloff=3		"leaves 3 lines between cursor and end of screen
set foldenable
set foldmethod=marker
set foldlevel=500
set foldnestmax=1
set cursorline      "Shows a visual horizontal line where the cursor is
" Allows for project specific vimrc's
set exrc
set secure

set ignorecase
set smartcase

"}}}
"{{{ Key Remaps
" makes <leader> be the space bar
let mapleader = "\<Space>"

" allows the cursor to move through wrapped lines elegantly
nnoremap j gj
nnoremap k gk

"makes Ctrl-S save
inoremap <C-S> <Esc>:update<CR>
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>

" Allows for moving between window splits with Ctrl-<direction>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Compile using the makefile when F5 is pressed
map <F5> :wa<CR> :!clear; make<CR>
map <C-4> :wa<CR> :!clear; make<CR>
" Run tests when F4 is pressed
map <F4> :wa<CR> :!clear; make test<CR>
map <C-4> :wa<CR> :!clear; make test<CR>

" Allows for Ctrl-/ to comment out lines
inoremap <C-_> <C-o>:call NERDComment(0,"toggle")<C-m>
vnoremap <C-_> :call NERDComment(0,"toggle")<C-m>
nnoremap <C-_> :call NERDComment(0,"toggle")<C-m>

"autocompletes brackets
inoremap {<CR> {<CR>}<Esc>kox<BS>

" Makes it so that vim doesn't delete tabs created by autoindent on empty
" lines. This works by typing a character and then deleting it, which forces
" the autoindenter to put in all the tabs
inoremap <CR> <CR>x<BS>
nnoremap o ox<BS>
nnoremap O Ox<BS>
nnoremap S Sx<BS>

" Copying and pasting from the system clipboard
vmap <Leader>y "+y
"nmap <Leader>yy "+yy
"nmap <Leader>dd "+dd
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Makes <Leader><CR> insert a carriage return
"nnoremap <Leader><CR> A<CR><Esc>
"vnoremap <Leader><CR> c<CR>

" <Leader>s saves session
noremap <Leader>s :wa<CR>:mks!<CR>

" Convenient way to exit insert mode
inoremap jk <Esc>
inoremap kj <Esc>

command MakeTags !ctags -R .

" so that I can q and wq without worrying if the shift is held
command Wq wq
command Q q
command WQ wq

" Open nerd tree command
nnoremap <Leader>t :NERDTreeTabsToggle<CR>

" Makes a double space clear highlight
nnoremap <Leader><Space> :noh<CR>
nnoremap , za

" makes 'w!!' write even if vim wasn't run as sudo
cmap w!! w !sudo tee > /dev/null %

" Makes <Leader>h switch between .cpp and .h files
nnoremap <Leader>h :update<CR>:e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Makes tab and shft tab go to next and previos tab, respectively
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" <Leader>i inserts a single character
"nnoremap <Leader>i i<Space><Esc>r

nnoremap J 5<C-e>
nnoremap K 5<C-y>

" Removes the error list
nnoremap <Leader>r :SyntasticReset<CR>

nnoremap <C-D> :sh<CR>

"""""""" Window stuff
" open conque shell vsplit
nnoremap <C-W>b :ConqueTermVSplit bash<CR>
nnoremap <C-W><C-B> :ConqueTermVSplit bash<CR>

inoremap <C-W>q <esc><C-W>q
inoremap <C-W><C-Q> <esc><C-W>q

" so that you can press tab in visual mode, and it will tab all highlighted
" lines
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap <C-Y> <C-I>

"nnoremap <C-F> :ConqueTermSplit bash<CR>ag
nnoremap <C-F> <c-w>s<c-w>j:call conque_term#open("bash").write('ag --vimgrep ')<CR>

function! SyncTree()
  if &modifiable
    NERDTreeFind
    wincmd p
  endif
endfunction
nnoremap <leader>w :call SyncTree()<CR>

"command :Shell :ConqueTerm bash<CR>
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
    nnoremap <f6> :!g++ %<CR>:!./%<CR>
    syn match semicolonComma "\v[;,]" containedin=ALLBUT,Comment
    hi def link semicolonComma Keyword
    
    set keywordprg=cppman
    
    set foldmethod=syntax
endfunction


autocmd Filetype python call SetPythonOptions()
function SetPythonOptions()
    nnoremap <f6> :!python %<CR>
    syn match semicolonComma "\v[;,]"
    hi def link semicolonComma Keyword
    
    set foldmethod=indent
    set foldnestmax=2
    
endfunction


"}}}
"{{{Statusline
set noruler
set laststatus=2
" Syntastic settings
set statusline+=%#warningmsg#
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
set statusline+=\ [%02{strwidth(getline('.'))}]
set statusline+=\ %3p%%\ 
"}}}