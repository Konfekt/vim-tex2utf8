This Vim plug-in provides the two commands `:LatexToUTF8` and `:UTF8ToLatex` that operate on a range (by default the whole buffer) and convert forth and back between `LaTeX` commands and Unicode (`UTF-8` encoded) characters, say between `\alpha` and `α`, `x^2` and `x²`, or `\mathbb{R}` and `ℝ`.

A command is only converted as a whole: `\in` is left alone in `\int`, and `^1` in `^12`.
Where several commands start alike, the longest one wins, say `\sqrt[3]` over `\sqrt`.
An escaped backslash, underscore or caret starts no command: `\\alpha` (a line break followed by `alpha`) and `a\_1` are left alone.
A control word followed by a letter is converted back with an empty group, say `αx` to `\alpha{}x` rather than `\alphax`, and `:LatexToUTF8` removes such a group, say from `\alpha{}x` to `αx`.
The built-in pairs never convert plain ASCII characters such as `{`, `#` or `|` back to `LaTeX`.

# Configuration

Pairs of `LaTeX` commands and Unicode characters between which to convert forth and back, say between `\command` and `c`, can be added to the list `g:latex2utf8_pairs`, say by adding to `vimrc` the lines:

```vim
let g:latex2utf8_pairs = [
      \ ['\command', 'c'],
      \ ]
```

To only convert forth from `\command` to `c`, add the pair to the list `g:latex2utf8_pairs_latex` instead:

```vim
let g:latex2utf8_pairs_latex = [
      \ ['\command', 'c'],
      \ ]
```

To only convert back from `c` to `\command`, add the pair to the list `g:latex2utf8_pairs_utf8` instead:

```vim
let g:latex2utf8_pairs_utf8 = [
      \ ['\command', 'c'],
      \ ]
```

These lists are read on each conversion, and their pairs take precedence over the built-in ones, which `latex2utf8#DefaultPairs()` returns.

# Tests

Run `test/run.sh` to run the headless tests in Vim and Neovim.

# Credits

The list of pairs between which to convert originated from Jos van den Oever's [unilatex.vim](https://www.vim.org/scripts/script.php?script_id=284).
