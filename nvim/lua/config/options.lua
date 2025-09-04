-- Global settings
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Editor settings
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = false -- Show relative line numbers
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.cursorline = true -- Highlight current line
vim.opt.wrap = false -- Don't wrap lines
vim.opt.scrolloff = 8 -- Keep 8 lines visible when scrolling
vim.opt.sidescrolloff = 8 -- Keep 8 columns visible when scrolling

-- Indentation
vim.opt.tabstop = 2 -- Tab width
vim.opt.shiftwidth = 2 -- Indentation width
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.softtabstop = 2 -- Tab key inserts 2 spaces
vim.opt.smartindent = true -- Smart autoindenting
vim.opt.breakindent = true -- Maintain indent when wrapping

-- Search
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.incsearch = true -- Incremental search
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase present

-- Visual
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.colorcolumn = "120" -- Show column at 80 characters
vim.opt.list = true -- Show invisible characters
vim.opt.listchars = { -- Define invisible characters
  tab = "→ ",
  trail = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "·",
}

-- Behavior
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.undofile = true -- Persistent undo
vim.opt.backup = false -- Don't create backup files
vim.opt.swapfile = false -- Don't create swap files
vim.opt.updatetime = 250 -- Faster completion
vim.opt.timeoutlen = 300 -- Faster key sequence timeout

-- Splits
vim.opt.splitbelow = true -- New horizontal splits below
vim.opt.splitright = true -- New vertical splits to the right

-- File handling
vim.opt.fileencoding = "utf-8" -- File encoding
vim.opt.conceallevel = 0 -- Don't hide characters

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })

-- Resize windows
vim.keymap.set(
  "n",
  "<S-Left>",
  ":vertical resize -2<CR>",
  { desc = "Decrease window width" }
)
vim.keymap.set(
  "n",
  "<S-Right>",
  ":vertical resize +2<CR>",
  { desc = "Increase window width" }
)
vim.keymap.set(
  "n",
  "<S-Up>",
  ":resize +2<CR>",
  { desc = "Increase window height" }
)
vim.keymap.set(
  "n",
  "<S-Down>",
  ":resize -2<CR>",
  { desc = "Decrease window height" }
)

-- Enabled language servers
vim.lsp.enable("luals")
vim.lsp.enable("pyright")
