scriptencoding utf-8

if !exists('g:latex2utf8_pairs')
	let g:latex2utf8_pairs = []
endif
let g:latex2utf8_pairs += [
			\ ['\alpha', 'α'],
			\ ['\beta', 'β'],
			\ ['\gamma', 'γ'],
			\ ['\delta', 'δ'],
			\ ['\epsilon', '∊'],
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
			\ ['_\delta', 'ᵨ'],
			\ ['_\phi', 'ᵩ'],
			\ ['_\gamma', 'ᵧ'],
			\ ['_\chi', 'ᵪ'],
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
			\ ['\longmapsto', '⇖'],
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
			\ ['\aleph', 'א'],
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
			\ ['\beth', 'ב'],
			\ ['\daleth', 'ד'],
			\ ['\gimel', 'ג'],
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
			\ ['\sqsubset', '⊏'],
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
			\ ['\sqsupset', '⊐'],
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
			\ ['\blacktriangleright', '▷'],
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
			\ ['\rtimes', '⋈'],
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
			\ ['\hbar', 'ℏ'],
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
			\ ['\angle', '∠'],
			\ ['\measuredangle', '∡'],
			\ ['\sphericalangle', '∢'],
			\ ['\backprime', '‵'],
			\ ['\nexists', '∄'],
			\ ['\Finv', 'Ⅎ'],
			\ ['\varnothing', '∅'],
			\ ['\eth', 'ð'],
			\ ['\mho', '℧'],
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
			\ ['\lbrace', '['],
			\ ['\lceil', '⌈'],
			\ ['\lfloor', '⌊'],
			\ ['\lgroup', '⌊'],
			\ ['\lmoustache', '⎛'],
			\ ['\rbrace', ']'],
			\ ['\rceil', '⌉'],
			\ ['\rfloor', '⌋'],
			\ ['\rgroup', '⌋'],
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
			\
			\ ['\{', '{'],
			\ ['\}', '}'],
			\ ['\#', '#'],
			\]

if !exists('g:latex2utf8_pairs_utf8') | let g:latex2utf8_pairs_utf8 = [] | endif
let g:latex2utf8_pairs_utf8 += [
			\]
if !exists('g:latex2utf8_pairs_latex') | let g:latex2utf8_pairs_latex = [] |endif
let g:latex2utf8_pairs_latex += [
			\ ['\,', ' '],
			\ ['\;', ' '],
			\ ['\:', ' '],
			\ ['\quad', '  '],
			\ ['\qquad', '		'],
			\
			\ ['\mid', '|'],
			\ ['\coloneq', ':='],
			\ ['\colon', ':'],
			\ ]

" function to convert latex symbols to utf-8
function! latex2utf8#LatexToUTF8(o, c) abort
	normal! m`

	let gdefault = &gdefault
	set gdefault&

	for p in g:latex2utf8_pairs + g:latex2utf8_pairs_latex
		exe 'silent keeppatterns ' . a:o . ',' . a:c . 'substitute/\V' . escape(p[0], '\/') . '\>/' . escape(p[1], '\/') . '/geI'
	endfor

	let &gdefault = gdefault
	normal! g``
endfunction
function! latex2utf8#UTF8ToLatex(o, c) abort
	normal! m`

	let gdefault = &gdefault
	set gdefault&

	for p in g:latex2utf8_pairs + g:latex2utf8_pairs_utf8
		exe 'silent keeppatterns ' . a:o . ',' . a:c . 'substitute/\V' . escape(p[1], '\/') . '/' . escape(p[0], '\/') . '/geI'
	endfor

	let &gdefault = gdefault
	normal! g``
endfunction

