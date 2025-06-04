"{{{ Plugins
let mapleader = "\<Space>"
call plug#begin()

Plug 'scrooloose/nerdtree'
let g:NERDTreeHijackNetrw = 0
let NERDTreeIgnore = ['\.pyc$','\.o$']
let NERDTreeMinimalUI = 1
let NERDTreeMapJumpNextSibling = '\<C-J>'
let NERDTreeMapJumpPrevSibling = '\<C-K>'
let g:NERDTreeQuitOnOpen = 1
" Open nerd tree command
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <leader>w :call SyncTree()<CR>
function! SyncTree()
  if &modifiable
    NERDTreeFind
    wincmd p
  endif
endfunction

Plug 'tpope/vim-vinegar'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'

"Plug 'ervandew/supertab'
"Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/undoquit.vim'
" Colorschemes
"Plug 'blueshirts/darcula'
"Plug 'sjl/badwolf'
"Plug 'altercation/vim-colors-solarized'
"Plug 'lifepillar/vim-solarized8'
Plug 'NLKNguyen/papercolor-theme'
"Plug 'tikhomirov/vim-glsl'

"Plug 'w0rp/ale'
"nnoremap <Leader>r :ALEToggle<CR>
"let g:ale_cpp_clangtidy_checks = ['*', '-cppcoreguidelines-pro-bounds-pointer-arithmetic']
"let g:ale_enabled = 1

"Plug 'm-pilia/vim-ccls'
"Plug 'skywind3000/vim-preview'
"Plug 'gcmt/taboo.vim'
"Plug 'SirVer/ultisnips'
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Plug 'honza/vim-snippets'
Plug 'tommcdo/vim-exchange'
"Plug 'OmniSharp/omnisharp-vim'
"let g:OmniSharp_server_stdio = 1
"let g:OmniSharp_highlighting = 0

"Plug 'OrangeT/vim-csharp'
Plug 'Chiel92/vim-autoformat'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Visual debugger. Turned off because nvim complains about requiring python3
"Plug 'puremourning/vimspector'
"let g:vimspector_enable_mappings = 'HUMAN'

" Allows copying of text over ssh without any need for X forwarding
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

if !exists(":tnoremap")
    Plug 'vim-scripts/Conque-GDB'
endif

Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'

call plug#end()
"}}}

source ~/.vim/common.vim
