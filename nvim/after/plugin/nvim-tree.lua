-- Settings specific to NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup()

-- Keymaps specific to NvimTree
vim.keymap.set(
  "n",
  "<leader>tt",
  ":NvimTreeToggle<CR>",
  { desc = "Toggle file explorer" }
)
vim.keymap.set(
  "n",
  "<leader>tf",
  ":NvimTreeFocus<CR>",
  { desc = "Focus file explorer" }
)
vim.keymap.set(
  "n",
  "<leader>tc",
  ":NvimTreeFindFile<CR>",
  { desc = "Find current file" }
)
