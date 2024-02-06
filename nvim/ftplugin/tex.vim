augroup texCmds
	autocmd!
	au VimLeave *.tex silent !latexmk -c
augroup END


