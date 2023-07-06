-- Option settings
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.laststatus = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.shiftwidth = 2
vim.opt.showtabline = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.wrap = false

-- Netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Navigate when in insert mode
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- Switching between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Navigate buffers
vim.keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>")
vim.keymap.set("n", "<S-l>", "<Cmd>bnext<CR>")
