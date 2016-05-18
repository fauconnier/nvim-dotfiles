"-----------------------------------------------------------------------------
" LaTex
"-----------------------------------------------------------------------------

let g:ycm_min_num_of_chars_for_completion=10000
hi texComment ctermfg=red ctermbg=white
" Remove LaTeX command
nmap <silent> dsa ds}dF\

" Define Vimtex global var
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" Compiling
"nmap <C-t> :silent VimtexCompileSS!<CR>

nmap <C-t> :call ExecLatex()<cr>

let g:neoterm_size = 4

function! ExecLatex()
    let base_dir = vimtex#get_root_dir()
    let base_file = vimtex#get_root_file()
    call neoterm#do('cd ' . base_dir)
    call neoterm#do('latexmk -pdflatex="pdflatex -synctex=1" -pdf ' . base_file)
endfunction

" For Beamer
nmap ln :call NextFrameBeamer()<cr>
nmap lN :call PreviousFrameBeamer()<cr>

function! NextFrameBeamer()
    silent! execute "normal! /begin\{frame\<cr>"
    silent! execute "normal! zt"
endfunction

function! PreviousFrameBeamer()
    silent! execute "normal! ?begin\{frame\<cr>"
    silent! execute "normal! zt"
endfunction



