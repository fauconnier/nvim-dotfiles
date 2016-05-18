"-----------------------------------------------------------------------------
" python
"-----------------------------------------------------------------------------

"autocmd BufEnter *.py :nmap <C-t> :Shell python %<CR>

"start python
nnoremap <localleader>rf :call neoterm#do("ipython")<cr>

"close python
nnoremap <localleader>rq :call ClosePython()<cr>

"clear console
nnoremap <localleader>rr :call neoterm#clear()<cr>

" exec file
nnoremap <C-T> :call Execfile()<cr>

"nnoremap <localleader>ro :call OpenObject()<cr>

nnoremap <Space> :call ExecLine()<cr>
vnoremap <Space> :TREPLSend<cr>

function! ClosePython()
    echo "Close"
    call neoterm#do("exit")
    call neoterm#clear()
    call neoterm#close()
endfunction

function! Execfile()
    let b:file = expand('%')
    call neoterm#do("execfile('". b:file ."')")
endfunction

