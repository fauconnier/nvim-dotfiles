"-----------------------------------------------------------------------------
" C
"-----------------------------------------------------------------------------
set colorcolumn=80

" Tlsit
nmap <silent><buffer> <localleader>lt :Tlist<CR>

" Execute on the fly
nmap <C-q> :call ExecFile("gcc % -o " . expand('%:r') . ".o && ./" . expand('%:r') . ".o")<cr>
nmap <C-t> :call ExecFile("make && ./main.o")<cr>

"autocmd BufEnter *.c :nmap <C-q> :Shell gcc % -o main.o && ./main.o <CR>
"autocmd BufEnter *.c :nmap <C-t> :Shell make && ./main.o <CR>
"autocmd BufEnter *.c :nmap <silent><buffer> <localleader>lt :Tlist<CR>
"autocmd BufEnter *.c :set colorcolumn=80

