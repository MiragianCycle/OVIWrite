local keymap = vim.keymap


-- Basic Keyboard Shortcuts
--
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>x", ":NvimTreeFocus<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>q", ":q!<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>t", ":terminal<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>s", ":w!<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>c", ":close<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>l", ":Lazy load all", { noremap = true, silent = true})
keymap.set("n", "<leader>L", ":Lazy <CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>w", ":WhichKey<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>a", ":Alpha<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>p", ":SoftPencil<CR>", { noremap = true, silent = true})
