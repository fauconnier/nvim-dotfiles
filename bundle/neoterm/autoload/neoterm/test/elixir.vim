function! neoterm#test#elixir#run(scope)
  let command = 'mix test'

  if a:scope == 'file'
    let command .= ' ' . expand('%:p')
  elseif a:scope == 'current'
    let command .= ' ' . expand('%:p') . ':' . line('.')
  endif

  return command
endfunction

function! neoterm#test#elixir#result_handler(line)
  let counters = matchlist(
        \ a:line,
        \ '\(\d\+\|no\) failures\?'
        \ )

  if !empty(counters)
    let failures = counters[1]

    if str2nr(failures) == 0
      let g:neoterm_statusline = g:neoterm_test_status.success
    else
      let g:neoterm_statusline = g:neoterm_test_status.failed
    end
  end
endfunction
