" Headless tests: run test/run.sh from the repository root.
set encoding=utf-8 hidden
scriptencoding utf-8
let s:root = fnamemodify(expand('<sfile>:p'), ':h:h')
let &runtimepath = s:root . ',' . &runtimepath
execute 'source' fnameescape(s:root . '/plugin/latex2utf8.vim')

let s:failed = []

function! s:Reset(lines) abort
  enew!
  call setline(1, a:lines)
endfunction

function! s:Forward(lines) abort
  call s:Reset(a:lines)
  LatexToUTF8
  return getline(1, '$')
endfunction

function! s:Backward(lines) abort
  call s:Reset(a:lines)
  UTF8ToLatex
  return getline(1, '$')
endfunction

function! Test_symbols_ending_in_non_letters() abort
  call assert_equal(['ℝ⁺ x₋ ℤ⁻ a b c d {x} { y} #1'],
        \ s:Forward(['\mathbb{R}^+ x_- \mathbb{Z}^- a\,b\;c\:d \{x\} \lbrace y\rbrace \#1']))
endfunction

function! Test_cube_root_wins_over_square_root() abort
  call assert_equal(['∛x √ y'], s:Forward(['\sqrt[3]x \sqrt y']))
endfunction

function! Test_ascii_left_alone_by_utf8_to_latex() abort
  let ascii = join(map(range(32, 126), 'nr2char(v:val)'), '')
  let lines = ['\frac{a}{b} \in [0,1] \# \{x\}', ascii, "\ttab"]
  call assert_equal(lines, s:Backward(lines))
endfunction

function! Test_control_word_boundaries() abort
  call assert_equal(['α2 α_b αβ ∫ \inf \alphabet x^ab x^12 x^2y ᵃ'],
        \ s:Forward(['\alpha2 \alpha_b \alpha\beta \int \inf \alphabet x^ab x^12 x^2y ^a']))
  setlocal iskeyword=@,48-57,_,192-255,\\
  call assert_equal(['α_b ∈'], s:Forward(['\alpha_b \in']))
endfunction

function! Test_cpoptions_with_C() abort
  let save = &cpoptions
  set cpoptions+=C
  try
    execute 'source' fnameescape(s:root . '/autoload/latex2utf8.vim')
    call assert_equal(['α'], s:Forward(['\alpha']))
  catch
    call assert_report('cpo+=C: ' . v:exception)
  finally
    let &cpoptions = save
  endtry
endfunction

function! Test_corrected_code_points() abort
  let pairs = [
        \ ['_\rho', 'ᵨ'], ['\longmapsto', '⟼'], ['\rtimes', '⋊'],
        \ ['\blacktriangleright', '▶'], ['\lgroup', '⟮'], ['\rgroup', '⟯'],
        \ ['\lmoustache', '⎰'], ['\aleph', 'ℵ'], ['\beth', 'ℶ'],
        \ ['\gimel', 'ℷ'], ['\daleth', 'ℸ'], ['\epsilon', 'ϵ']]
  for [latex, utf8] in pairs
    call assert_equal([utf8], s:Forward([latex]), latex)
    call assert_equal([latex], s:Backward([utf8]), utf8)
  endfor
  " Hebrew text and the subscript-less \delta stay as they are.
  call assert_equal(['שלום אבגד ∊'], s:Backward(['שלום אבגד ∊']))
  call assert_equal(['x_δ'], s:Forward(['x_\delta']))
endfunction

function! Test_user_pairs_override_defaults() abort
  let save = [get(g:, 'latex2utf8_pairs_latex', []), get(g:, 'latex2utf8_pairs_utf8', [])]
  let g:latex2utf8_pairs_latex = [['\alpha', 'a'], ['\R', 'ℝ']]
  let g:latex2utf8_pairs_utf8 = [['\upalpha', 'α']]
  try
    call assert_equal(['a ℝ β'], s:Forward(['\alpha \R \beta']))
    call assert_equal(['\upalpha \beta'], s:Backward(['α β']))
  finally
    let [g:latex2utf8_pairs_latex, g:latex2utf8_pairs_utf8] = save
  endtry
endfunction

" An escaped backslash, underscore or caret starts no command: '\\alpha' is a
" line break followed by 'alpha', '\_1' an underscore and 1, '\^o' an accent.
function! Test_escaped_commands_left_alone() abort
  call assert_equal(['x\\alpha a\_1 \^o \\α \\\\β \\\\\\ \\{ α'],
        \ s:Forward(['x\\alpha a\_1 \^o \\\alpha \\\\\beta \\\\\\ \\{ \alpha']))
  call assert_equal(['\\', '\_1'], s:Forward(['\\', '\_1']))
endfunction

" A control word followed by a letter is separated by an empty group {}:
" αx became \alphax, a different command.  LatexToUTF8 removes that group.
function! Test_control_word_before_letter() abort
  call assert_equal(['\alpha{}x \alpha\beta \alpha{} _\beta{}c \alpha2 x^ab'], s:Backward(['αx αβ α{} ᵦc α2 xᵃb']))
  call assert_equal(['αx αβ α ᵦc α{x} \alphax'], s:Forward(['\alpha{}x \alpha{}\beta \alpha{} _\beta{}c \alpha{x} \alphax']))
  call assert_equal(['αx ℏbar'], s:Forward(s:Backward(['αx ℏbar'])))
endfunction

" Keys of user pairs starting with characters special in a collection.
function! Test_user_keys_starting_with_special_characters() abort
  let save = get(g:, 'latex2utf8_pairs_latex', [])
  let g:latex2utf8_pairs_latex = [[']]', '⟧'], ['-->', '⟶'], ['^^', '↑↑']]
  try
    call assert_equal(['⟧ ⟶ ↑↑ ²'], s:Forward([']] --> ^^ ^2']))
  finally
    let g:latex2utf8_pairs_latex = save
  endtry
endfunction

function! Test_special_characters_in_user_pairs() abort
  let save = [get(g:, 'latex2utf8_pairs_latex', []), get(g:, 'latex2utf8_pairs_utf8', [])]
  let g:latex2utf8_pairs_latex = [['\&', '&'], ['a/b', '~\1'], ['--', '–']]
  let g:latex2utf8_pairs_utf8 = [['\slash', '/'], ['\rbrack', ']'], ['\caret', '^'],
        \ ['\minus', '-'], ['\backslash', '\'], ['\amp', '&'], ['x', '']]
  try
    call assert_equal(['& ~\1 – α'], s:Forward(['\& a/b -- \alpha']))
    call assert_equal(['\slash\rbrack\caret\minus\backslash\amp\alpha x'], s:Backward(['/]^-\&α x']))
  finally
    let [g:latex2utf8_pairs_latex, g:latex2utf8_pairs_utf8] = save
  endtry
endfunction

function! Test_user_pairs_set_after_first_use() abort
  call s:Forward(['\alpha'])
  let g:latex2utf8_pairs = [['\foo', 'ƒ']]
  try
    call assert_equal(['ƒ α'], s:Forward(['\foo \alpha']))
    call assert_equal(['\foo \alpha'], s:Backward(['ƒ α']))
  finally
    let g:latex2utf8_pairs = []
  endtry
endfunction

function! Test_round_trip_of_all_pairs() abort
  let defaults = latex2utf8#DefaultPairs()
  let first = {}
  let canonical = []
  for [latex, utf8] in defaults.both
    call assert_equal([utf8 . ' x'], s:Forward([latex . ' x']), latex)
    if !has_key(first, utf8)
      let first[utf8] = latex
      call add(canonical, [latex, utf8])
    endif
  endfor
  for [latex, utf8] in defaults.latex
    call assert_equal(['x' . utf8 . '1'], s:Forward(['x' . latex . '1']), latex)
    call assert_true(utf8 =~# '^[\x20-\x7e\t]*$', latex)
  endfor
  for [latex, utf8] in defaults.both
    call assert_true(utf8 =~# '[^\x00-\x7f]', 'non-ASCII: ' . latex)
  endfor
  let latex_line = join(map(copy(canonical), 'v:val[0]'), ' ')
  let utf8_line = join(map(copy(canonical), 'v:val[1]'), ' ')
  call assert_equal([utf8_line], s:Forward([latex_line]))
  call assert_equal([latex_line], s:Backward([utf8_line]))
endfunction

function! Test_multibyte_round_trip() abort
  let latex = ['Für 漢字 😀: \forall x \in \mathbb{F}, x^2 \geq 0 \to ä',
        \ '\alpha_1 + \beta^\alpha = é \cdot ∑']
  let utf8 = ['Für 漢字 😀: ∀ x ∈ 𝔽, x² ≥ 0 → ä',
        \ 'α₁ + βᵅ = é ⋅ ∑']
  call assert_equal(utf8, s:Forward(latex))
  call assert_equal(['Für 漢字 😀: \forall x \in \mathbb{F}, x^2 \geq 0 \rightarrow ä',
        \ '\alpha_1 + \beta^\alpha = é \cdot \sum'], s:Backward(utf8))
endfunction

function! Test_range_cursor_and_gdefault() abort
  call s:Reset(['\alpha \alpha', '\beta \beta', '\gamma'])
  call cursor(3, 4)
  set gdefault
  try
    2LatexToUTF8
    call assert_equal(['\alpha \alpha', 'β β', '\gamma'], getline(1, '$'))
    call assert_true(&gdefault)
  finally
    set gdefault&
  endtry
  call assert_equal([3, 4], [line('.'), col('.')])
  %LatexToUTF8
  UTF8ToLatex
  call assert_equal(['\alpha \alpha', '\beta \beta', '\gamma'], getline(1, '$'))
  call assert_equal('', @/)
endfunction

for s:test in sort(filter(map(split(execute('function /^Test_'), "\n"),
      \ 'matchstr(v:val, ''Test_\w\+'')'), '!empty(v:val)'))
  let v:errors = []
  try
    call call(s:test, [])
  catch
    call add(v:errors, s:test . ': ' . v:exception . ' @ ' . v:throwpoint)
  endtry
  if empty(v:errors)
    call add(s:failed, 'ok ' . s:test)
  else
    call extend(s:failed, map(copy(v:errors), '"FAIL " . s:test . ": " . v:val'))
  endif
endfor

call writefile(s:failed, $TEST_OUT)
qall!
