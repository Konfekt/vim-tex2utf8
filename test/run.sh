#!/bin/sh
# Run the headless tests in Vim and Neovim (whichever are installed).
cd "$(dirname "$0")/.." || exit 1
status=0
out=$(mktemp)
for editor in vim nvim; do
  command -v "$editor" >/dev/null 2>&1 || continue
  if [ "$editor" = vim ]; then
    TEST_OUT=$out vim -Nu NONE -i NONE -es -S test/test.vim
  else
    TEST_OUT=$out nvim --clean --headless -S test/test.vim
  fi
  echo "== $editor"
  if [ -s "$out" ]; then cat "$out"; else echo "FAIL no results"; status=1; fi
  grep -q '^FAIL' "$out" && status=1
  : > "$out"
done
rm -f "$out"
exit "$status"
