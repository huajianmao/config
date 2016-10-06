let g:vim_markdown_folding_disabled=1
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>pv :!google-chrome "%:p"<CR>
