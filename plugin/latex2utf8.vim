if &compatible || exists('g:loaded_latex2utf8')
  finish
endif
let g:loaded_latex2utf8 = 1

command! -bar -range=% LatexToUTF8 call latex2utf8#LatexToUTF8(<line1>, <line2>)
command! -bar -range=% UTF8ToLatex call latex2utf8#UTF8ToLatex(<line1>, <line2>)
