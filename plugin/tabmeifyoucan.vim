" Vim global plugin that tries to use buffers in open tabs if possible
" Maintainer:	Barry Arthur <barry.arthur@gmail.com>
" Version:	0.1
" Description:	Attempt to jump to tabpage holding target buffer
" Last Change:	2014-04-27
" License:	Vim License (see :help license)
" Location:	plugin/tabmeifyoucan.vim
" Website:	https://github.com/dahu/tabmeifyoucan
"
" See tabmeifyoucan.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help tabmeifyoucan

" Vimscript Setup: {{{1
" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

function! TabMeIfYouCan(func_pair, arg_pair)
  let fn = call(a:func_pair[0], a:arg_pair[0])
  echo 'fn=' . fn
  if buflisted(fn)
    let old_swb = &swb
    let &swb = 'usetab'
    exe 'sbuffer ' . fn
    let &swb = old_swb
  end
  return call(a:func_pair[1], a:arg_pair[1])
endfunction

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo

" Template From: https://github.com/dahu/Area-41/
" vim: set sw=2 sts=2 et fdm=marker:
