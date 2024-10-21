vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--- Normal Mode Key Mappings ---
-- Better window navigation
keymap("n", "<C-l>", "<C-w>h", opts)
keymap("n", "<C-;>", "<C-w>l", opts)
keymap("n", ";", "<esc>", opts)

-- Resize with arrows
keymap("n", "<C-S-j>", ":resize +2<CR>", opts)
keymap("n", "<C-S-k>", ":resize -2<CR>", opts)
keymap("n", "<C-S-l>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-;>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

--- Visual Mode Key Mappings ---
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("v", ";", "<esc>", opts)
keymap('n', 'y', '"+y', opts)
keymap('v', 'y', '"+y', opts)
keymap('x', 'y', '"+y', opts )

-- Visual Block Mode Key Mappings
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Terminal Mode Key Mappings
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

-- Telescope key mappings
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- NvimTree toggle and focus
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts)

