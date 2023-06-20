local keymap = vim.keymap.set

-- We need a leader key
vim.g.mapleader = " "

-- Toggle line
keymap(
  "n",
  "<Leader>tl",
  function()
    local val = vim.diagnostic.config().virtual_text
    vim.diagnostic.config { virtual_lines = val, virtual_text = not val }
  end,
  {}
)
