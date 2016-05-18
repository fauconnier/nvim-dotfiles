"-----------------------------------------------------------------------------
" C++
"-----------------------------------------------------------------------------
set colorcolumn=80
let g:ycm_confirm_extra_conf=0
"let g:easytags_async=1
"let g:easytags_events = ['BufEnter']

" Tlsit
nmap <silent><buffer> <localleader>lt :Tlist<CR>

" Execute on the fly
nmap <C-q> :call ExecFile("g++ % -o " . expand('%:r') . ".o && ./" . expand('%:r') . ".o")<cr>
nmap <C-t> :call ExecFile("make && ./main.o")<cr>
