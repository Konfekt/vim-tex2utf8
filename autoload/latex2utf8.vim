scriptencoding utf-8

let s:save_cpo = &cpoptions
set cpoptions&vim

" Pairs of a LaTeX command and its Unicode character, converted both ways.
" If several pairs share a character, the first one wins in UTF8ToLatex.
let s:pairs = [
			\ ['^0', '⁰'],
			\ ['^1', '¹'],
			\ ['^2', '²'],
			\ ['^3', '³'],
			\ ['^4', '⁴'],
			\ ['^5', '⁵'],
			\ ['^6', '⁶'],
			\ ['^7', '⁷'],
			\ ['^8', '⁸'],
			\ ['^9', '⁹'],
			\ ['^a', 'ᵃ'],
			\ ['^b', 'ᵇ'],
			\ ['^c', 'ᶜ'],
			\ ['^d', 'ᵈ'],
			\ ['^e', 'ᵉ'],
			\ ['^f', 'ᶠ'],
			\ ['^g', 'ᵍ'],
			\ ['^h', 'ʰ'],
			\ ['^i', 'ⁱ'],
			\ ['^j', 'ʲ'],
			\ ['^k', 'ᵏ'],
			\ ['^l', 'ˡ'],
			\ ['^m', 'ᵐ'],
			\ ['^n', 'ⁿ'],
			\ ['^o', 'ᵒ'],
			\ ['^p', 'ᵖ'],
			\ ['^r', 'ʳ'],
			\ ['^s', 'ˢ'],
			\ ['^t', 'ᵗ'],
			\ ['^u', 'ᵘ'],
			\ ['^v', 'ᵛ'],
			\ ['^w', 'ʷ'],
			\ ['^x', 'ˣ'],
			\ ['^y', 'ʸ'],
			\ ['^z', 'ᶻ'],
			\ ['^A', 'ᴬ'],
			\ ['^B', 'ᴮ'],
			\ ['^D', 'ᴰ'],
			\ ['^E', 'ᴱ'],
			\ ['^G', 'ᴳ'],
			\ ['^H', 'ᴴ'],
			\ ['^I', 'ᴵ'],
			\ ['^J', 'ᴶ'],
			\ ['^K', 'ᴷ'],
			\ ['^L', 'ᴸ'],
			\ ['^M', 'ᴹ'],
			\ ['^N', 'ᴺ'],
			\ ['^O', 'ᴼ'],
			\ ['^P', 'ᴾ'],
			\ ['^R', 'ᴿ'],
			\ ['^T', 'ᵀ'],
			\ ['^U', 'ᵁ'],
			\ ['^W', 'ᵂ'],
			\ ['^+', '⁺'],
			\ ['^-', '⁻'],
			\ ['^\alpha', 'ᵅ'],
			\ ['^\beta', 'ᵝ'],
			\ ['^\gamma', 'ᵞ'],
			\ ['^\delta', 'ᵟ'],
			\ ['^\epsilon', 'ᵋ'],
			\ ['^\theta', 'ᶿ'],
			\ ['^\iota', 'ᶥ'],
			\ ['^\Phi', 'ᶲ'],
			\ ['^\varphi', 'ᵠ'],
			\ ['^\chi', 'ᵡ'],
			\
			\ ['_0', '₀'],
			\ ['_1', '₁'],
			\ ['_2', '₂'],
			\ ['_3', '₃'],
			\ ['_4', '₄'],
			\ ['_5', '₅'],
			\ ['_6', '₆'],
			\ ['_7', '₇'],
			\ ['_8', '₈'],
			\ ['_9', '₉'],
			\ ['_a', 'ₐ'],
			\ ['_e', 'ₑ'],
			\ ['_h', 'ₕ'],
			\ ['_i', 'ᵢ'],
			\ ['_j', 'ⱼ'],
			\ ['_k', 'ₖ'],
			\ ['_l', 'ₗ'],
			\ ['_m', 'ₘ'],
			\ ['_n', 'ₙ'],
			\ ['_o', 'ₒ'],
			\ ['_p', 'ₚ'],
			\ ['_r', 'ᵣ'],
			\ ['_s', 'ₛ'],
			\ ['_t', 'ₜ'],
			\ ['_u', 'ᵤ'],
			\ ['_v', 'ᵥ'],
			\ ['_x', 'ₓ'],
			\ ['_+', '₊'],
			\ ['_-', '₋'],
			\ ['_\beta', 'ᵦ'],
			\ ['_\rho', 'ᵨ'],
			\ ['_\phi', 'ᵩ'],
			\ ['_\gamma', 'ᵧ'],
			\ ['_\chi', 'ᵪ'],
			\
			\ ['\alpha', 'α'],
			\ ['\beta', 'β'],
			\ ['\gamma', 'γ'],
			\ ['\delta', 'δ'],
			\ ['\epsilon', 'ϵ'],
			\ ['\varepsilon', 'ε'],
			\ ['\zeta', 'ζ'],
			\ ['\eta', 'η'],
			\ ['\theta', 'θ'],
			\ ['\vartheta', 'ϑ'],
			\ ['\iota', 'ι'],
			\ ['\kappa', 'κ'],
			\ ['\lambda', 'λ'],
			\ ['\mu', 'μ'],
			\ ['\nu', 'ν'],
			\ ['\xi', 'ξ'],
			\ ['\pi', 'π'],
			\ ['\varpi', 'ϖ'],
			\ ['\rho', 'ρ'],
			\ ['\varrho', 'ϱ'],
			\ ['\sigma', 'σ'],
			\ ['\varsigma', 'ς'],
			\ ['\tau', 'τ'],
			\ ['\upsilon', 'υ'],
			\ ['\phi', 'φ'],
			\ ['\varphi', 'ϕ'],
			\ ['\chi', 'χ'],
			\ ['\psi', 'ψ'],
			\ ['\omega', 'ω'],
			\ ['\Gamma', 'Γ'],
			\ ['\Delta', 'Δ'],
			\ ['\Theta', 'Θ'],
			\ ['\Lambda', 'Λ'],
			\ ['\Xi', 'Ξ'],
			\ ['\Pi', 'Π'],
			\ ['\Upsilon', 'Υ'],
			\ ['\Phi', 'Φ'],
			\ ['\Psi', 'Ψ'],
			\ ['\Omega', 'Ω'],
			\
			\ ['\leq', '≤'],
			\ ['\ll', '≪'],
			\ ['\prec', '≺'],
			\ ['\preceq', '≼'],
			\ ['\subset', '⊂'],
			\ ['\subseteq', '⊆'],
			\ ['\sqsubset', '⊏'],
			\ ['\sqsubseteq', '⊑'],
			\ ['\in', '∈'],
			\ ['\vdash', '⊢'],
			\ ['\smile', '⌣'],
			\ ['\geq', '≥'],
			\ ['\gg', '≫'],
			\ ['\succ', '≻'],
			\ ['\succeq', '≽'],
			\ ['\supset', '⊃'],
			\ ['\supseteq', '⊇'],
			\ ['\sqsupset', '⊐'],
			\ ['\sqsupseteq', '⊒'],
			\ ['\ni', '∋'],
			\ ['\dashv', '⊣'],
			\ ['\parallel', '∥'],
			\ ['\frown', '⌢'],
			\ ['\notin', '∉'],
			\ ['\equiv', '≡'],
			\ ['\doteq', '≐'],
			\ ['\sim', '∼'],
			\ ['\simeq', '≃'],
			\ ['\approx', '≈'],
			\ ['\cong', '≅'],
			\ ['\Join', '⋈'],
			\ ['\bowtie', '⋈'],
			\ ['\propto', '∝'],
			\ ['\models', '⊨'],
			\ ['\perp', '⊥'],
			\ ['\asymp', '≍'],
			\ ['\neq', '≠'],
			\ ['\pm', '±'],
			\ ['\cdot', '⋅'],
			\ ['\times', '×'],
			\ ['\cup', '∪'],
			\ ['\sqcup', '⊔'],
			\ ['\vee', '∨'],
			\ ['\oplus', '⊕'],
			\ ['\odot', '⊙'],
			\ ['\otimes', '⊗'],
			\ ['\bigtriangleup', '△'],
			\ ['\lhd', '⊲'],
			\ ['\unlhd', '⊴'],
			\ ['\mp', '∓'],
			\ ['\div', '÷'],
			\ ['\setminus', '∖'],
			\ ['\cap', '∩'],
			\ ['\sqcap', '⊓'],
			\ ['\wedge', '∧'],
			\ ['\ominus', '⊖'],
			\ ['\oslash', '⊘'],
			\ ['\bigcirc', '○'],
			\ ['\bigtriangledown', '▽'],
			\ ['\rhd', '⊳'],
			\ ['\unrhd', '⊵'],
			\ ['\triangleleft', '◁'],
			\ ['\triangleright', '▷'],
			\ ['\star', '⋆'],
			\ ['\ast', '∗'],
			\ ['\circ', '∘'],
			\ ['\bullet', '∙'],
			\ ['\diamond', '⋄'],
			\ ['\uplus', '⊎'],
			\ ['\dagger', '†'],
			\ ['\ddagger', '‡'],
			\ ['\wr', '≀'],
			\ ['\sum', '∑'],
			\ ['\prod', '∏'],
			\ ['\coprod', '∐'],
			\ ['\int', '∫'],
			\ ['\bigcup', '⋃'],
			\ ['\bigcap', '⋂'],
			\ ['\bigsqcup', '⊔'],
			\ ['\oint', '∮'],
			\ ['\bigvee', '⋁'],
			\ ['\bigwedge', '⋀'],
			\ ['\bigoplus', '⊕'],
			\ ['\bigotimes', '⊗'],
			\ ['\bigodot', '⊙'],
			\ ['\biguplus', '⊎'],
			\ ['\leftarrow', '←'],
			\ ['\rightarrow', '→'],
			\ ['\leftrightarrow', '↔'],
			\ ['\Leftarrow', '⇐'],
			\ ['\Rightarrow', '⇒'],
			\ ['\Leftrightarrow', '⇔'],
			\ ['\mapsto', '↦'],
			\ ['\hookleftarrow', '↩'],
			\ ['\leftharpoonup', '↼'],
			\ ['\leftharpoondown', '↽'],
			\ ['\hookrightarrow', '↪'],
			\ ['\rightharpoonup', '⇀'],
			\ ['\rightharpoondown', '⇁'],
			\ ['\longleftarrow', '←'],
			\ ['\longrightarrow', '→'],
			\ ['\longleftrightarrow', '↔'],
			\ ['\Longleftarrow', '⇐'],
			\ ['\Longrightarrow', '⇒'],
			\ ['\Longleftrightarrow', '⇔'],
			\ ['\longmapsto', '⟼'],
			\ ['\uparrow', '↑'],
			\ ['\downarrow', '↓'],
			\ ['\updownarrow', '↕'],
			\ ['\Uparrow', '⇑'],
			\ ['\Downarrow', '⇓'],
			\ ['\Updownarrow', '⇕'],
			\ ['\nearrow', '↗'],
			\ ['\searrow', '↘'],
			\ ['\swarrow', '↙'],
			\ ['\nwarrow', '↖'],
			\ ['\leadsto', '↝'],
			\ ['\dots', '…'],
			\ ['\cdots', '⋯'],
			\ ['\vdots', '⋮'],
			\ ['\ddots', '⋱'],
			\ ['\hbar', 'ℏ'],
			\ ['\ell', 'ℓ'],
			\ ['\Re', 'ℜ'],
			\ ['\Im', 'ℑ'],
			\ ['\aleph', 'ℵ'],
			\ ['\wp', '℘'],
			\ ['\forall', '∀'],
			\ ['\exists', '∃'],
			\ ['\mho', '℧'],
			\ ['\partial', '∂'],
			\ ['\prime', '′'],
			\ ['\emptyset', '∅'],
			\ ['\infty', '∞'],
			\ ['\nabla', '∇'],
			\ ['\triangle', '△'],
			\ ['\Box', '□'],
			\ ['\Diamond', '◇'],
			\ ['\bot', '⊥'],
			\ ['\top', '⊤'],
			\ ['\angle', '∠'],
			\ ['\surd', '√'],
			\ ['\diamondsuit', '♢'],
			\ ['\heartsuit', '♡'],
			\ ['\clubsuit', '♣'],
			\ ['\spadesuit', '♠'],
			\ ['\neg', '¬'],
			\ ['\flat', '♭'],
			\ ['\natural', '♮'],
			\ ['\sharp', '♯'],
			\ ['\digamma', 'Ϝ'],
			\ ['\varkappa', 'ϰ'],
			\ ['\beth', 'ℶ'],
			\ ['\daleth', 'ℸ'],
			\ ['\gimel', 'ℷ'],
			\ ['\lessdot', '⋖'],
			\ ['\leqslant', '≤'],
			\ ['\leqq', '≦'],
			\ ['\lll', '⋘'],
			\ ['\lesssim', '≲'],
			\ ['\lessgtr', '≶'],
			\ ['\lesseqgtr', '⋚'],
			\ ['\preccurlyeq', '≼'],
			\ ['\curlyeqprec', '⋞'],
			\ ['\precsim', '≾'],
			\ ['\Subset', '⋐'],
			\ ['\therefore', '∴'],
			\ ['\smallsmile', '⌣'],
			\ ['\vartriangleleft', '⊲'],
			\ ['\trianglelefteq', '⊴'],
			\ ['\gtrdot', '⋗'],
			\ ['\geqq', '≧'],
			\ ['\ggg', '⋙'],
			\ ['\gtrsim', '≳'],
			\ ['\gtrless', '≷'],
			\ ['\gtreqless', '⋛'],
			\ ['\succcurlyeq', '≽'],
			\ ['\curlyeqsucc', '⋟'],
			\ ['\succsim', '≿'],
			\ ['\Supset', '⋑'],
			\ ['\because', '∵'],
			\ ['\shortparallel', '∥'],
			\ ['\smallfrown', '⌢'],
			\ ['\vartriangleright', '⊳'],
			\ ['\trianglerighteq', '⊵'],
			\ ['\doteqdot', '≑'],
			\ ['\risingdotseq', '≓'],
			\ ['\fallingdotseq', '≒'],
			\ ['\eqcirc', '≖'],
			\ ['\circeq', '≗'],
			\ ['\triangleq', '≜'],
			\ ['\bumpeq', '≏'],
			\ ['\Bumpeq', '≎'],
			\ ['\thicksim', '∼'],
			\ ['\thickapprox', '≈'],
			\ ['\approxeq', '≊'],
			\ ['\backsim', '∽'],
			\ ['\vDash', '⊨'],
			\ ['\Vdash', '⊩'],
			\ ['\Vvdash', '⊪'],
			\ ['\backepsilon', '∍'],
			\ ['\varpropto', '∝'],
			\ ['\between', '≬'],
			\ ['\pitchfork', '⋔'],
			\ ['\blacktriangleleft', '◀'],
			\ ['\blacktriangleright', '▶'],
			\ ['\dashleftarrow', '⇠'],
			\ ['\leftleftarrows', '⇇'],
			\ ['\leftrightarrows', '⇆'],
			\ ['\Lleftarrow', '⇚'],
			\ ['\twoheadleftarrow', '↞'],
			\ ['\leftarrowtail', '↢'],
			\ ['\leftrightharpoons', '⇋'],
			\ ['\Lsh', '↰'],
			\ ['\looparrowleft', '↫'],
			\ ['\curvearrowleft', '↶'],
			\ ['\circlearrowleft', '↺'],
			\ ['\dashrightarrow', '⇢'],
			\ ['\rightrightarrows', '⇉'],
			\ ['\rightleftarrows', '⇄'],
			\ ['\Rrightarrow', '⇛'],
			\ ['\twoheadrightarrow', '↠'],
			\ ['\rightarrowtail', '↣'],
			\ ['\rightleftharpoons', '⇌'],
			\ ['\Rsh', '↱'],
			\ ['\looparrowright', '↬'],
			\ ['\curvearrowright', '↷'],
			\ ['\circlearrowright', '↻'],
			\ ['\multimap', '⊸'],
			\ ['\upuparrows', '⇈'],
			\ ['\downdownarrows', '⇊'],
			\ ['\upharpoonleft', '↿'],
			\ ['\upharpoonright', '↾'],
			\ ['\downharpoonleft', '⇃'],
			\ ['\downharpoonright', '⇂'],
			\ ['\rightsquigarrow', '⇝'],
			\ ['\leftrightsquigarrow', '↭'],
			\ ['\dotplus', '∔'],
			\ ['\ltimes', '⋉'],
			\ ['\Cup', '⋓'],
			\ ['\veebar', '⊻'],
			\ ['\boxplus', '⊞'],
			\ ['\boxtimes', '⊠'],
			\ ['\leftthreetimes', '⋋'],
			\ ['\curlyvee', '⋎'],
			\ ['\centerdot', '⋅'],
			\ ['\rtimes', '⋊'],
			\ ['\Cap', '⋒'],
			\ ['\barwedge', '⊼'],
			\ ['\boxminus', '⊟'],
			\ ['\boxdot', '⊡'],
			\ ['\rightthreetimes', '⋌'],
			\ ['\curlywedge', '⋏'],
			\ ['\intercal', '⊺'],
			\ ['\divideontimes', '⋇'],
			\ ['\smallsetminus', '∖'],
			\ ['\circleddash', '⊝'],
			\ ['\circledcirc', '⊚'],
			\ ['\circledast', '⊛'],
			\ ['\hslash', 'ℏ'],
			\ ['\square', '□'],
			\ ['\blacksquare', '■'],
			\ ['\circledS', 'Ⓢ'],
			\ ['\vartriangle', '△'],
			\ ['\blacktriangle', '▲'],
			\ ['\complement', '∁'],
			\ ['\triangledown', '▽'],
			\ ['\blacktriangledown', '▼'],
			\ ['\lozenge', '◊'],
			\ ['\blacklozenge', '◆'],
			\ ['\bigstar', '★'],
			\ ['\measuredangle', '∡'],
			\ ['\sphericalangle', '∢'],
			\ ['\backprime', '‵'],
			\ ['\nexists', '∄'],
			\ ['\Finv', 'Ⅎ'],
			\ ['\varnothing', '∅'],
			\ ['\eth', 'ð'],
			\
			\ ['\mathbb{C}', 'ℂ'],
			\ ['\mathbb{F}', '𝔽'],
			\ ['\mathbb{H}', 'ℍ'],
			\ ['\mathbb{N}', 'ℕ'],
			\ ['\mathbb{P}', 'ℙ'],
			\ ['\mathbb{Q}', 'ℚ'],
			\ ['\mathbb{R}', 'ℝ'],
			\ ['\mathbb{Z}', 'ℤ'],
			\
			\ ['\lceil', '⌈'],
			\ ['\lfloor', '⌊'],
			\ ['\lgroup', '⟮'],
			\ ['\lmoustache', '⎰'],
			\ ['\rceil', '⌉'],
			\ ['\rfloor', '⌋'],
			\ ['\rgroup', '⟯'],
			\
			\ ['\to', '→'],
			\
			\ ['\sqrt', '√'],
			\ ['\sqrt[3]', '∛'],
			\
			\ ['\nmid', '∤'],
			\
			\ ['\langle', '⟨'],
			\ ['\rangle', '⟩'],
			\]

" Pairs converted only from LaTeX to Unicode, because the Unicode side is
" plain ASCII or whitespace that must be left alone in UTF8ToLatex.
let s:pairs_latex = [
			\ ['\{', '{'],
			\ ['\}', '}'],
			\ ['\lbrace', '{'],
			\ ['\rbrace', '}'],
			\ ['\#', '#'],
			\
			\ ['\,', ' '],
			\ ['\;', ' '],
			\ ['\:', ' '],
			\ ['\quad', '  '],
			\ ['\qquad', '		'],
			\
			\ ['\mid', '|'],
			\ ['\coloneq', ':='],
			\ ['\colon', ':'],
			\]

" Return copies of the built-in pairs: 'both' are converted in both
" directions, 'latex' only from LaTeX to Unicode.
function! latex2utf8#DefaultPairs() abort
	return {'both': deepcopy(s:pairs), 'latex': deepcopy(s:pairs_latex)}
endfunction

function! latex2utf8#LatexToUTF8(line1, line2) abort
	call s:Convert(a:line1, a:line2,
				\ get(g:, 'latex2utf8_pairs', []) + get(g:, 'latex2utf8_pairs_latex', [])
				\ + s:pairs + s:pairs_latex, 0)
endfunction

function! latex2utf8#UTF8ToLatex(line1, line2) abort
	call s:Convert(a:line1, a:line2,
				\ get(g:, 'latex2utf8_pairs', []) + get(g:, 'latex2utf8_pairs_utf8', [])
				\ + s:pairs, 1)
endfunction

" Replace, in a single pass over the lines line1 to line2, each occurrence of
" pair[from] by pair[!from] for all given pairs.  The longest key matching at
" a position wins, and the first pair given for a key.
function! s:Convert(line1, line2, pairs, from) abort
	let [table, pattern] = s:Compile(a:pairs, a:from)
	if empty(table)
		return
	endif

	let view = winsaveview()
	try
		execute 'silent keeppatterns' a:line1 . ',' . a:line2 . 'substitute/' . pattern
					\ . '/\=l:table[submatch(0)]/e' . (&gdefault ? '' : 'g')
	finally
		call winrestview(view)
	endtry
endfunction

" Return the table from key to replacement and the pattern matching all keys,
" cached for the last pairs given in each direction.
let s:cache = [[[], {}, ''], [[], {}, '']]
function! s:Compile(pairs, from) abort
	let cache = s:cache[a:from]
	if cache[0] ==# a:pairs
		return cache[1:]
	endif

	let table = {}
	let trie = {}
	for pair in a:pairs
		let key = pair[a:from]
		if empty(key) || has_key(table, key)
			continue
		endif
		let table[key] = pair[!a:from]
		let node = trie
		for char in split(key, '\zs')
			if !has_key(node, char)
				let node[char] = {}
			endif
			let node = node[char]
		endfor
		" The empty string marks the end of a key and holds what may follow it.
		let node[''] = a:from == 0 ? s:LatexBoundary(key) : ''
	endfor
	" The backtracking regexp engine is much faster on the LaTeX keys.
	let pattern = (a:from == 0 ? '\%#=1' : '') . '\V\C' . s:TriePattern(trie)
	let s:cache[a:from] = [deepcopy(a:pairs), table, pattern]
	return [table, pattern]
endfunction

" Return a very-nomagic pattern matching all keys in the trie, that is, a
" branch per character shared by keys, so that a match fails fast.  Keys
" ending in a plain character are merged into a collection, and longer keys
" come before a key ending at the same node.
function! s:TriePattern(node) abort
	let branches = []
	let leaves = []
	for char in sort(filter(keys(a:node), '!empty(v:val)'))
		let child = a:node[char]
		if child == {'': ''} && char !~# '[]^\\/-]'
			call add(leaves, char)
		else
			call add(branches, escape(char, '\/') . s:TriePattern(child))
		endif
	endfor
	if len(leaves) == 1
		call add(branches, leaves[0])
	elseif len(leaves) > 1
		call add(branches, '\[' . join(leaves, '') . ']')
	endif
	if has_key(a:node, '')
		call add(branches, a:node[''])
	endif
	return len(branches) == 1 ? branches[0] : '\%(' . join(branches, '\|') . '\)'
endfunction

" Return what must not follow the LaTeX command key for it to match in full:
" a control word such as \in must not be followed by a letter (to leave \int
" alone), and a sub- or superscript such as ^1 not by a letter or digit.
function! s:LatexBoundary(key) abort
	if a:key =~# '^[_^][0-9A-Za-z]$'
		return '\[0-9A-Za-z]\@!'
	elseif a:key =~# '\a$'
		return '\a\@!'
	endif
	return ''
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
