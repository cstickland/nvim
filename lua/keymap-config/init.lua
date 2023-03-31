local map = vim.api.nvim_set_keymap
local args = { noremap = true, silent = true }

-- Toggle Neotree

-- Save with Ctrl-s
map("n", "<C-s>", ":w<cr>", args)
map("n", "<C-x>", ":bd<cr>", args)
-- Cycle through buffers
map("n", "<S-TAB>", ":TablineBufferNext<cr>", args)
map("n", "<C-h>", ":TablineBufferPrevious<cr>", args)

-- Comment Lines
map("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", args)
map("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", args)

map("n", "<leader>lf", ":lua vim.lsp.buf.format()<cr>", args)
