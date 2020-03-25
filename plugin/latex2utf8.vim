if &compatible || exists('g:loaded_latex2utf8')
    finish
endif

let s:keepcpo         = &cpo
set cpo&vim
" ------------------------------------------------------------------------------

command! -range=% LatexToUTF8 call latex2utf8#LatexToUTF8(<line1>, <line2>)
command! -range=% UTF8ToLatex call latex2utf8#UTF8ToLatex(<line1>, <line2>)

let g:loaded_latex2utf8 = 1

" ------------------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo
