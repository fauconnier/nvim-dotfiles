"-----------------------------------------------------------------------------
" xml
"-----------------------------------------------------------------------------

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

autocmd BufEnter *.xml :nmap <C-t> :Shell xmllint --valid --noout % <CR>

