"-----------------------------------------------------------------------------
" PHP
"-----------------------------------------------------------------------------
autocmd BufEnter *.php :nmap <C-t> :Shell php -f % <CR>
autocmd BufEnter *.php :nmap <localleader>lv :execute 'silent ! reload Vimperator' <CR>
autocmd BufEnter *.php :set colorcolumn=80

autocmd BufEnter *.tpl :set filetype=html
autocmd BufEnter *.tpl :nmap <C-t> :silent !reload Vimperator<CR>

