set number relativenumber


set laststatus=0

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
autocmd vimEnter * colorscheme nordic
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

"LSP and completer
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"refresh snippets
nnoremap <leader>rs <Cmd>call UltiSnips#RefreshSnippets()<CR>

"ColorSchemes
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
 
" Easy sorround
Plug 'tpope/vim-surround'

"Easy commenting
Plug 'preservim/nerdcommenter'

"Latex
Plug 'lervag/vimtex'
"let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0

"Format Gocode
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }

"Git conflicts
Plug 'akinsho/git-conflict.nvim', { 'tag': '*' }


"Vimwiki
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Documents/Notes'}]

"Window Resizer
Plug 'simeji/winresizer'

"===============================
"TreeSitter
"===============================
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}



call plug#end()

"===============================
"TreeSitter (syntax highlighting)
"===============================
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { 
	  "c", "python", "vim", "vimdoc",
	  "bash", "html", "go", "latex", "css", "templ"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
"===============================
"Completer
"===============================
lua require("init")

noremap <leader>f :lua vim.lsp.buf.format()<CR>

"text wrapping at 80 chars
set whichwrap+=<,>,h,l
set textwidth=80
filetype plugin on
