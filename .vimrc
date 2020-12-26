" enable number lines
set number relativenumber

" enter the millenium
set nocompatible

" pathfinding and wildmenu
set wildmenu
set path+=**

" tagfinding
command! MakeTags !ctags -R .

" change cursor depending on mode
let &t_EI = "\e[2 q"
let &t_SI = "\e[5 q"

" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
autocmd VimLeave * silent !echo -ne "\e[5 q"
augroup END

" autoindent is true
set autoindent

"PLUGINS SETUP
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" PLUGINS
" NerdCommnter
Plugin 'preservim/nerdcommenter'
let g:NERDCreateDefaultMappings = 1

" Sorrounder
Plugin 'tpope/vim-surround'



call vundle#end()
filetype plugin indent on 

"My mappings
nnoremap V <c-v>

