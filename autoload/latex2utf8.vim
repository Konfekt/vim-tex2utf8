scriptencoding utf-8

if !exists('g:conversions_latex')
  let g:conversions_latex = []
endif
let g:conversions_latex += [
			\ ['\\alpha', 'α'],
			\ ['\\beta', 'β'],
			\ ['\\gamma', 'γ'],
			\ ['\\delta', 'δ'],
			\ ['\\epsilon', '∊'],
			\ ['\\varepsilon', 'ε'],
			\ ['\\zeta', 'ζ'],
			\ ['\\eta', 'η'],
			\ ['\\theta', 'θ'],
			\ ['\\vartheta', 'ϑ'],
			\ ['\\iota', 'ι'],
			\ ['\\kappa', 'κ'],
			\ ['\\lambda', 'λ'],
			\ ['\\mu', 'μ'],
			\ ['\\nu', 'ν'],
			\ ['\\xi', 'ξ'],
			\ ['\\pi', 'π'],
			\ ['\\varpi', 'ϖ'],
			\ ['\\rho', 'ρ'],
			\ ['\\varrho', 'ϱ'],
			\ ['\\sigma', 'σ'],
			\ ['\\varsigma', 'ς'],
			\ ['\\tau', 'τ'],
			\ ['\\upsilon', 'υ'],
			\ ['\\phi', 'φ'],
			\ ['\\varphi', 'ϕ'],
			\ ['\\chi', 'χ'],
			\ ['\\psi', 'ψ'],
			\ ['\\omega', 'ω'],
			\ ['\\Gamma', 'Γ'],
			\ ['\\Delta', 'Δ'],
			\ ['\\Theta', 'Θ'],
			\ ['\\Lambda', 'Λ'],
			\ ['\\Xi', 'Ξ'],
			\ ['\\Pi', 'Π'],
			\ ['\\Upsilon', 'Υ'],
			\ ['\\Phi', 'Φ'],
			\ ['\\Psi', 'Ψ'],
			\ ['\\Omega', 'Ω'],
			\ ['\\leq', '≤'],
			\ ['\\ll', '≪'],
			\ ['\\prec', '≺'],
			\ ['\\preceq', '≼'],
			\ ['\\subset', '⊂'],
			\ ['\\subseteq', '⊆'],
			\ ['\\sqsubset', '⊏'],
			\ ['\\sqsubseteq', '⊑'],
			\ ['\\in', '∈'],
			\ ['\\vdash', '⊢'],
			\ ['\\mid', '∣'],
			\ ['\\smile', '⌣'],
			\ ['\\geq', '≥'],
			\ ['\\gg', '≫'],
			\ ['\\succ', '≻'],
			\ ['\\succeq', '≽'],
			\ ['\\supset', '⊃'],
			\ ['\\supseteq', '⊇'],
			\ ['\\sqsupset', '⊐'],
			\ ['\\sqsupseteq', '⊒'],
			\ ['\\ni', '∋'],
			\ ['\\dashv', '⊣'],
			\ ['\\parallel', '∥'],
			\ ['\\frown', '⌢'],
			\ ['\\notin', '∉'],
			\ ['\\equiv', '≡'],
			\ ['\\doteq', '≐'],
			\ ['\\sim', '∼'],
			\ ['\\simeq', '≃'],
			\ ['\\approx', '≈'],
			\ ['\\cong', '≅'],
			\ ['\\Join', '⋈'],
			\ ['\\bowtie', '⋈'],
			\ ['\\propto', '∝'],
			\ ['\\models', '⊨'],
			\ ['\\perp', '⊥'],
			\ ['\\asymp', '≍'],
			\ ['\\neq', '≠'],
			\ ['\\pm', '±'],
			\ ['\\cdot', '⋅'],
			\ ['\\times', '×'],
			\ ['\\cup', '∪'],
			\ ['\\sqcup', '⊔'],
			\ ['\\vee', '∨'],
			\ ['\\oplus', '⊕'],
			\ ['\\odot', '⊙'],
			\ ['\\otimes', '⊗'],
			\ ['\\bigtriangleup', '△'],
			\ ['\\lhd', '⊲'],
			\ ['\\unlhd', '⊴'],
			\ ['\\mp', '∓'],
			\ ['\\div', '÷'],
			\ ['\\setminus', '∖'],
			\ ['\\cap', '∩'],
			\ ['\\sqcap', '⊓'],
			\ ['\\wedge', '∧'],
			\ ['\\ominus', '⊖'],
			\ ['\\oslash', '⊘'],
			\ ['\\bigcirc', '○'],
			\ ['\\bigtriangledown', '▽'],
			\ ['\\rhd', '⊳'],
			\ ['\\unrhd', '⊵'],
			\ ['\\triangleleft', '◁'],
			\ ['\\triangleright', '▷'],
			\ ['\\star', '⋆'],
			\ ['\\ast', '∗'],
			\ ['\\circ', '∘'],
			\ ['\\bullet', '∙'],
			\ ['\\diamond', '⋄'],
			\ ['\\uplus', '⊎'],
			\ ['\\dagger', '†'],
			\ ['\\ddagger', '‡'],
			\ ['\\wr', '≀'],
			\ ['\\sum', '∑'],
			\ ['\\prod', '∏'],
			\ ['\\coprod', '∐'],
			\ ['\\int', '∫'],
			\ ['\\bigcup', '⋃'],
			\ ['\\bigcap', '⋂'],
			\ ['\\bigsqcup', '⊔'],
			\ ['\\oint', '∮'],
			\ ['\\bigvee', '⋁'],
			\ ['\\bigwedge', '⋀'],
			\ ['\\bigoplus', '⊕'],
			\ ['\\bigotimes', '⊗'],
			\ ['\\bigodot', '⊙'],
			\ ['\\biguplus', '⊎'],
			\ ['\\leftarrow', '←'],
			\ ['\\rightarrow', '→'],
			\ ['\\leftrightarrow', '↔'],
			\ ['\\Leftarrow', '⇐'],
			\ ['\\Rightarrow', '⇒'],
			\ ['\\Rightarrow', ''],
			\ ['\\Leftrightarrow', '⇔'],
			\ ['\\mapsto', '↦'],
			\ ['\\hookleftarrow', '↩'],
			\ ['\\leftharpoonup', '↼'],
			\ ['\\leftharpoondown', '↽'],
			\ ['\\hookrightarrow', '↪'],
			\ ['\\rightharpoonup', '⇀'],
			\ ['\\rightharpoondown', '⇁'],
			\ ['\\longleftarrow', '←'],
			\ ['\\longrightarrow', '→'],
			\ ['\\longleftrightarrow', '↔'],
			\ ['\\Longleftarrow', '⇐'],
			\ ['\\Longrightarrow', '⇒'],
			\ ['\\Longleftrightarrow', '⇔'],
			\ ['\\longmapsto', '⇖'],
			\ ['\\uparrow', '↑'],
			\ ['\\downarrow', '↓'],
			\ ['\\updownarrow', '↕'],
			\ ['\\Uparrow', '⇑'],
			\ ['\\Downarrow', '⇓'],
			\ ['\\Updownarrow', '⇕'],
			\ ['\\nearrow', '↗'],
			\ ['\\searrow', '↘'],
			\ ['\\swarrow', '↙'],
			\ ['\\nwarrow', '↖'],
			\ ['\\leadsto', '↝'],
			\ ['\\dots', '…'],
			\ ['\\cdots', '⋯'],
			\ ['\\vdots', '⋮'],
			\ ['\\ddots', '⋱'],
			\ ['\\hbar', 'ℏ'],
			\ ['\\ell', 'ℓ'],
			\ ['\\Re', 'ℜ'],
			\ ['\\Im', 'ℑ'],
			\ ['\\aleph', 'א'],
			\ ['\\wp', '℘'],
			\ ['\\forall', '∀'],
			\ ['\\exists', '∃'],
			\ ['\\mho', '℧'],
			\ ['\\partial', '∂'],
			\ ['\\prime', '′'],
			\ ['\\emptyset', '∅'],
			\ ['\\infty', '∞'],
			\ ['\\nabla', '∇'],
			\ ['\\triangle', '△'],
			\ ['\\Box', '□'],
			\ ['\\Diamond', '◇'],
			\ ['\\bot', '⊥'],
			\ ['\\top', '⊤'],
			\ ['\\angle', '∠'],
			\ ['\\surd', '√'],
			\ ['\\diamondsuit', '♢'],
			\ ['\\heartsuit', '♡'],
			\ ['\\clubsuit', '♣'],
			\ ['\\spadesuit', '♠'],
			\ ['\\neg', '¬'],
			\ ['\\flat', '♭'],
			\ ['\\natural', '♮'],
			\ ['\\sharp', '♯'],
			\ ['\\digamma', 'Ϝ'],
			\ ['\\varkappa', 'ϰ'],
			\ ['\\beth', 'ב'],
			\ ['\\daleth', 'ד'],
			\ ['\\gimel', 'ג'],
			\ ['\\lessdot', '⋖'],
			\ ['\\leqslant', '≤'],
			\ ['\\leqq', '≦'],
			\ ['\\lll', '⋘'],
			\ ['\\lesssim', '≲'],
			\ ['\\lessgtr', '≶'],
			\ ['\\lesseqgtr', '⋚'],
			\ ['\\preccurlyeq', '≼'],
			\ ['\\curlyeqprec', '⋞'],
			\ ['\\precsim', '≾'],
			\ ['\\Subset', '⋐'],
			\ ['\\sqsubset', '⊏'],
			\ ['\\therefore', '∴'],
			\ ['\\smallsmile', '⌣'],
			\ ['\\vartriangleleft', '⊲'],
			\ ['\\trianglelefteq', '⊴'],
			\ ['\\gtrdot', '⋗'],
			\ ['\\geqq', '≧'],
			\ ['\\ggg', '⋙'],
			\ ['\\gtrsim', '≳'],
			\ ['\\gtrless', '≷'],
			\ ['\\gtreqless', '⋛'],
			\ ['\\succcurlyeq', '≽'],
			\ ['\\curlyeqsucc', '⋟'],
			\ ['\\succsim', '≿'],
			\ ['\\Supset', '⋑'],
			\ ['\\sqsupset', '⊐'],
			\ ['\\because', '∵'],
			\ ['\\shortparallel', '∥'],
			\ ['\\smallfrown', '⌢'],
			\ ['\\vartriangleright', '⊳'],
			\ ['\\trianglerighteq', '⊵'],
			\ ['\\doteqdot', '≑'],
			\ ['\\risingdotseq', '≓'],
			\ ['\\fallingdotseq', '≒'],
			\ ['\\eqcirc', '≖'],
			\ ['\\circeq', '≗'],
			\ ['\\triangleq', '≜'],
			\ ['\\bumpeq', '≏'],
			\ ['\\Bumpeq', '≎'],
			\ ['\\thicksim', '∼'],
			\ ['\\thickapprox', '≈'],
			\ ['\\approxeq', '≊'],
			\ ['\\backsim', '∽'],
			\ ['\\vDash', '⊨'],
			\ ['\\Vdash', '⊩'],
			\ ['\\Vvdash', '⊪'],
			\ ['\\backepsilon', '∍'],
			\ ['\\varpropto', '∝'],
			\ ['\\between', '≬'],
			\ ['\\pitchfork', '⋔'],
			\ ['\\blacktriangleleft', '◀'],
			\ ['\\blacktriangleright', '▷'],
			\ ['\\dashleftarrow', '⇠'],
			\ ['\\leftleftarrows', '⇇'],
			\ ['\\leftrightarrows', '⇆'],
			\ ['\\Lleftarrow', '⇚'],
			\ ['\\twoheadleftarrow', '↞'],
			\ ['\\leftarrowtail', '↢'],
			\ ['\\leftrightharpoons', '⇋'],
			\ ['\\Lsh', '↰'],
			\ ['\\looparrowleft', '↫'],
			\ ['\\curvearrowleft', '↶'],
			\ ['\\circlearrowleft', '↺'],
			\ ['\\dashrightarrow', '⇢'],
			\ ['\\rightrightarrows', '⇉'],
			\ ['\\rightleftarrows', '⇄'],
			\ ['\\Rrightarrow', '⇛'],
			\ ['\\twoheadrightarrow', '↠'],
			\ ['\\rightarrowtail', '↣'],
			\ ['\\rightleftharpoons', '⇌'],
			\ ['\\Rsh', '↱'],
			\ ['\\looparrowright', '↬'],
			\ ['\\curvearrowright', '↷'],
			\ ['\\circlearrowright', '↻'],
			\ ['\\multimap', '⊸'],
			\ ['\\upuparrows', '⇈'],
			\ ['\\downdownarrows', '⇊'],
			\ ['\\upharpoonleft', '↿'],
			\ ['\\upharpoonright', '↾'],
			\ ['\\downharpoonleft', '⇃'],
			\ ['\\downharpoonright', '⇂'],
			\ ['\\rightsquigarrow', '⇝'],
			\ ['\\leftrightsquigarrow', '↭'],
			\ ['\\dotplus', '∔'],
			\ ['\\ltimes', '⋉'],
			\ ['\\Cup', '⋓'],
			\ ['\\veebar', '⊻'],
			\ ['\\boxplus', '⊞'],
			\ ['\\boxtimes', '⊠'],
			\ ['\\leftthreetimes', '⋋'],
			\ ['\\curlyvee', '⋎'],
			\ ['\\centerdot', '⋅'],
			\ ['\\rtimes', '⋈'],
			\ ['\\Cap', '⋒'],
			\ ['\\barwedge', '⊼'],
			\ ['\\boxminus', '⊟'],
			\ ['\\boxdot', '⊡'],
			\ ['\\rightthreetimes', '⋌'],
			\ ['\\curlywedge', '⋏'],
			\ ['\\intercal', '⊺'],
			\ ['\\divideontimes', '⋇'],
			\ ['\\smallsetminus', '∖'],
			\ ['\\circleddash', '⊝'],
			\ ['\\circledcirc', '⊚'],
			\ ['\\circledast', '⊛'],
			\ ['\\hbar', 'ℏ'],
			\ ['\\hslash', 'ℏ'],
			\ ['\\square', '□'],
			\ ['\\blacksquare', '■'],
			\ ['\\circledS', 'Ⓢ'],
			\ ['\\vartriangle', '△'],
			\ ['\\blacktriangle', '▲'],
			\ ['\\complement', '∁'],
			\ ['\\triangledown', '▽'],
			\ ['\\blacktriangledown', '▼'],
			\ ['\\lozenge', '◊'],
			\ ['\\blacklozenge', '◆'],
			\ ['\\bigstar', '★'],
			\ ['\\angle', '∠'],
			\ ['\\measuredangle', '∡'],
			\ ['\\sphericalangle', '∢'],
			\ ['\\backprime', '‵'],
			\ ['\\nexists', '∄'],
			\ ['\\Finv', 'Ⅎ'],
			\ ['\\varnothing', '∅'],
			\ ['\\eth', 'ð'],
			\ ['\\mho', '℧'],
			\
  		\ ['\\mathbb{C}', 'ℂ'],
  		\ ['\\mathbb{F}', '𝔽'],
  		\ ['\\mathbb{H}', 'ℍ'],
  		\ ['\\mathbb{N}', 'ℕ'],
  		\ ['\\mathbb{P}', 'ℙ'],
  		\ ['\\mathbb{Q}', 'ℚ'],
  		\ ['\\mathbb{R}', 'ℝ'],
  		\ ['\\mathbb{Z}', 'ℤ'],
			\
  		\ ['\\lbrace', '['],
  		\ ['\\lceil', '⌈'],
  		\ ['\\lfloor', '⌊'],
  		\ ['\\lgroup', '⌊'],
  		\ ['\\lmoustache', '⎛'],
  		\ ['\\rbrace', ']'],
  		\ ['\\rceil', '⌉'],
  		\ ['\\rfloor', '⌋'],
  		\ ['\\rgroup', '⌋'],
			\
			\ ['\\to', '→'],
			\
  		\ ['\\sqrt', '√'],
			\
  		\ ['\\coloneq', ':='],
  		\ ['\\colon', ':'],
			\
  		\ ['\\mid', '∤'],
  		\ ['\\nmid', '⟨'],
			\
  		\ ['\\langle', '⟨'],
  		\ ['\\rangle', '⟩'],
			\
  		\ ['\\{', '{'],
  		\ ['\\}', '}'],
  		\ ['\\#', '#'],
			\
  		\ ['\\,', ' '],
\ ]

" function to convert latex symbols to utf-8
function! latex2utf8#LatexToUTF8(o, c) abort
  normal! m`

  let gdefault = &gdefault
  set gdefault&

  for c in g:conversions_latex
    exe 'silent keeppatterns ' . a:o . ',' . a:c . 'substitute/\V' . c[0] . '/' . c[1] . '/geI'
  endfor

  let &gdefault = gdefault
  normal! g``
endfunction
function! latex2utf8#UTF8ToLatex(o, c) abort
  normal! m`

  let gdefault = &gdefault
  set gdefault&

  for c in g:conversions_latex
    exe 'silent keeppatterns ' . a:o . ',' . a:c . 'substitute/\V' . c[1] . '/' . c[0] . '/geI'
  endfor

  let &gdefault = gdefault
  normal! g``
endfunction
