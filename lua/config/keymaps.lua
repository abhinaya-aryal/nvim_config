local keymap = vim.keymap.set
local opts = { silent = true }

-- INFO: Better window navigation
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- INFO: Resize with arrows
keymap("n", "<c-up>", ":resize -2<cr>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- INFO: Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- INFO: Better paste in visual mode
keymap("v", "p", '"_dP', opts)

-- INFO: Copy whole file content to clipboard
keymap("n", "<c-c>", ":%y+<CR>", opts)

-- INFO: Save file
keymap("n", "<leader>u", "<cmd>update<cr>", { silent = true, desc = "Update File" })

-- INFO: Enter Normal mode from insert mode terminal mode and visual mode
keymap("i", "ij", "<ESC>", opts)
keymap("v", "ij", "<ESC>", opts)
keymap("t", "ij", [[<ESC><C-\><C-n>]], opts)

-- INFO: Indentation in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- INFO: Move line up or down in all modes
keymap("n", "<a-j>", ":m .+1<cr>", opts)
keymap("n", "<a-k>", ":m .-2<CR>", opts)
keymap("i", "<a-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<a-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<a-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<a-k>", ":m '>+1<CR>gv=gv", opts)
