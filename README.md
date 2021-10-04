This Vim plug-in provides the two commands `:Latex2UTF8` and `:UTF8ToLatex` that operate on a range (by default the whole buffer) and convert forth and back between `LaTeX` commands and Unicode (`UTF-8` encoded) characters.

# Configuration

Pairs of `LaTeX` commands and Unicode characters between which to convert forth and back, say between `\command` and `c`, can be passed via the list `g:latex2utf8_pairs_latex`, say by  adding to `vimrc` the lines:

```vim
let g:latex2utf8_pairs_latex = [
			\ ['\command, 'c'],
			\]
```

The other way around, to convert back from `c` to `\command`, add to the list `g:latex2utf8_pairs_utf8` the same pair:

```vim
let g:latex2utf8_pairs_utf8 = [
			\ ['\command, 'c'],
			\]
```

# Credits

The list of pairs between which to convert originated from Jos van den Oever's [unilatex.vim](https://www.vim.org/scripts/script.php?script_id=284).

