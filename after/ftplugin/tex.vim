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
    "let base_dir = vimtex#get_root_dir()
    "let base_file = vimtex#get_root_file()
    "call neoterm#do('cd ' . base_dir)
    "call neoterm#do('latexmk -pdflatex="pdflatex -synctex=1" -pdf ' . base_file)

    call neoterm#do('latexmk -pdflatex="pdflatex -synctex=1" -pdf ' . '%')
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


"------------------ 
" My own TexPlugin 
"------------------
nmap gg :call ViewWithSynctex()<cr>


function! GetBaseDir()

    

endfunction

function! ViewWithSynctex()    
  if !executable('xdotool') | return | endif
  if !executable('synctex') | return | endif

  let cmd_synctex_view = 'synctex view -i '
        \ . (line('.') + 1) . ':'
        \ . (col('.') + 1) . ':'
        \ . expand('%:p')
        \ . ' -o ' . 'these.pdf' 
        \ . " | grep -m1 'Page:' | sed 's/Page://' | tr -d '\n'"
  let page = system(cmd_synctex_view)

  
  if page > 0
    "let exe = {}
    "let exe.cmd  = 'xdotool'
    "let exe.cmd .= ' type --window ' . self.xwin_id
    "let exe.cmd .= ' "' . self.page . 'g"'
    "call vimtex#util#execute(exe)
    "let self.cmd_forward_search = exe.cmd
  endif
    
  echo "Page:" . page

endfunction


