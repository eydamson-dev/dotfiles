local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap comma as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Remap command mode
keymap("n", ";;", ":", opts)

-- keymap("n", "<space>e", ":Lex 30<cr>", opts)
keymap("n", "<leader>ei", ":edit ~/.config/nvim/init.lua<CR>", opts)
keymap("n", "<leader>em", ":edit ~/.config/nvim/lua/user/keymaps.lua<CR>", opts)
keymap("n", "<leader>ep", ":edit ~/.config/nvim/lua/user/plugins.lua<CR>", opts)
keymap("n", "<leader>el", ":edit ~/.config/nvim/lua/user/lsp/handlers.lua<CR>", opts)
keymap("n", "<leader>eo", ":edit ~/.config/nvim/lua/user/options.lua<CR>", opts)

--Unhiglight search
keymap("n", "<space><space>", ":nohlsearch<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- Better saving
keymap("n", "ss", ":w<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-k>", ":bnext<CR>", opts)
-- keymap("n", "<S-j>", ":bprevious<CR>", opts)

-- Close buffer
-- keymap("n", "<C-x>", ":bd<CR>", opts)
-- keymap("n", "<C-x>", ":Bdelete<CR>", opts)
-- keymap("n", "<C-q>", ":q<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jj", "<ESC>", opts)
-- ESC then insert at the end
keymap("i", "jk", "<ESC>A", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
