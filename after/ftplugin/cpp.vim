"-----------------------------------------------------------------------------
" C++
"-----------------------------------------------------------------------------
set colorcolumn=80
let g:ycm_confirm_extra_conf=0
"let g:easytags_async=1
"let g:easytags_events = ['BufEnter']

" Tlsit
nmap <silent><buffer> <localleader>lt :Tlist<CR>

nmap <C-q> :call neoterm#do("g++ % -o " . expand('%:r') . ".o && ./" . expand('%:r') . ".o")<cr>
nmap <C-t> :call neoterm#do("make && ./main.o")<cr>

