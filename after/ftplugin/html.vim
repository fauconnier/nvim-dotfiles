"-----------------------------------------------------------------------------
" HTML
"-----------------------------------------------------------------------------
"autocmd BufEnter *.html :nmap <C-t> :silent !reload Vimperator<CR>
autocmd BufEnter *.html :nmap <localleader>lv :execute 'silent ! firefox %' <CR>
"autocmd BufEnter *.html :nmap <C-t> :execute 'silent ! reload Vimperator' <CR>
autocmd BufEnter *.html :set colorcolumn=80

