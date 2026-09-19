local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
  desc = "Clear search highlight",
})

map("n", "<C-s>", "<cmd>w<CR>", {
  desc = "Save file",
})

map("n", "<C-q>", "<cmd>q<CR>", {
  desc = "Quit",
})

map("n", "<C-h>", "<C-w>h", {
  desc = "Move left",
})

map("n", "<C-j>", "<C-w>j", {
  desc = "Move down",
})

map("n", "<C-k>", "<C-w>k", {
  desc = "Move up",
})

map("n", "<C-l>", "<C-w>l", {
  desc = "Move right",
})

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {
  desc = "Find files",
})

map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {
  desc = "Live grep",
})

map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {
  desc = "Find buffers",
})

map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", {
  desc = "Help",
})

-- Neo-tree
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
  desc = "Toggle file tree",
})
