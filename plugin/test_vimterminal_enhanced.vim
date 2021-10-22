if !exists('g:loaded_test')
  echoerr "vim-test must be loaded before vim-test-vimterminal-enhanced"
  finish
endif

if exists('g:loaded_test_vimterminal_enhanced')
  finish
endif
let g:loaded_test_vimterminal_enhanced = 1

let g:test#custom_strategies['vimterminal_enhanced'] = function('test_vimterminal_enhanced#run')
let g:test#strategy = 'vimterminal_enhanced'

command! -bar TestClose call test_vimterminal_enhanced#close()
