"-----------------------------------------------------------------------------
" markdown
"-----------------------------------------------------------------------------
autocmd BufEnter *.md :set filetype=markdown
autocmd BufEnter *.md :nmap <C-t> :NeomakeSh pandoc --number-sections % -o %:r.pdf<CR>
autocmd BufEnter *.md :nmap <silent><buffer> <localleader>lv :call ReadOkular()<CR>
function! ReadOkular()
    silent !clear
    execute "silent !" . "okular" . " --unique " . "%:r" . ".pdf 1>&- 2>&- &"
    execute "redraw!"
endfunction
autocmd BufEnter *.md :nmap <silent><buffer> <localleader>lt :Toc<CR>

