function! test_vimterminal_enhanced#run(cmd) abort
  call test_vimterminal_enhanced#close()

  let term_position = get(g:, 'test#vim#term_position', 'botright')
  execute term_position . ' new'

  let cmd = !s:Windows() ?  ['/bin/sh', '-c', a:cmd] : ['cmd.exe', '/c', a:cmd]
  let g:test_vimterminal_enhanced#term_buffer = term_start(cmd, {'curwin': 1, 'term_name': a:cmd})

  setlocal nonumber nobuflisted
  au BufLeave <buffer> wincmd p

  nnoremap <buffer> <C-C> :q!<CR>
  tnoremap <buffer> <C-C> <C-W>N:q!<CR>

  wincmd p
  wincmd =
endfunction

function! test_vimterminal_enhanced#close() abort
  if exists("g:test_vimterminal_enhanced#term_buffer") && bufwinnr(g:test_vimterminal_enhanced#term_buffer) != -1
    execute g:test_vimterminal_enhanced#term_buffer . "bdelete!"
  endif
endfunction

function! s:Windows() abort
  return has('win32') && fnamemodify(&shell, ':t') ==? 'cmd.exe'
endfunction
