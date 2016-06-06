"-----------------------------------------------------------------------------
" LaTex
"-----------------------------------------------------------------------------

" Remove LaTeX command
nmap <silent> dsa ds}dF\

" Define Vimtex global var
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

nmap <C-t> :call ExecLatex()<cr>

let g:neoterm_size = 4
let g:global_tex = ""
nmap <F2> : let g:global_tex = expand('%:p')<cr>

function! ExecLatex()
    call neoterm#do('X')
    call neoterm#clear()
    if !exists("global_tex")
        call neoterm#do('latexmk -pdflatex="lualatex -synctex=1" -pdf ' . '%')
    elseif
        call neoterm#do('latexmk -pdflatex="lualatex -synctex=1" -pdf ' . g:global_tex)
    endif
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
"nmap gg :call ViewWithSynctex()<cr>

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


