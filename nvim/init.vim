set number relativenumber


set laststatus=0

" enter the millenium
set nocompatible

set encoding=utf-8
" pathfinding and wildmenu
set wildmenu
set path+=**
" change cursor depending on mode
let &t_EI = "\e[2 q"
let &t_SI = "\e[5 q"

" Optionally reset the cursor on start:
augroup myCmds
autocmd!
autocmd VimEnter * silent !echo -ne "\e[2 q"
autocmd VimLeave * set guicursor= | call chansend(v:stderr, "\e[5 q")
"autocmd VimLeave * set guicursor=a:ver-blinkon0
augroup END

" autoindent is true
set autoindent
" default indents before plugins
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab


" folding
set foldmethod=indent
set foldlevelstart=99

call plug#begin()
 
" Easy sorround
Plug 'tpope/vim-surround'

"Easy commenting
Plug 'preservim/nerdcommenter'
"override commenting in assembly
let g:NERDCustomDelimiters = {
    \ 'riscv': { 'left': '#', 'leftAlt': ';' }
    \ }

"Latex
Plug 'lervag/vimtex'
"let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0

"AutoComplete
Plug 'ycm-core/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion = 1
"binded by tab with supertab
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"supertab
"Used to make ultisnips work with ycm
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<C-n>'

"Format Gocode
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }

"Assembly highlighting
Plug 'kylelaker/riscv.vim'

"Git conflicts
Plug 'akinsho/git-conflict.nvim', { 'tag': '*' }

"ultisnips engine
Plug 'SirVer/ultisnips'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"refresh snippets
nnoremap <leader>rs <Cmd>call UltiSnips#RefreshSnippets()<CR>

"Vimwiki
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Documents/Notes'}]

"VimRacket
Plug 'wlangstroth/vim-racket'

"Window Resizer
Plug 'simeji/winresizer'

"Conjure
"Evaluates Lisps
Plug 'Olical/conjure'



call plug#end()

"text wrapping at 80 chars
set whichwrap+=<,>,h,l
set textwidth=80
filetype plugin on
