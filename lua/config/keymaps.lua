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
keymap.set("n", "<leader>sp", ":SoftPencil<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>g", ":LazyGit<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>o", ":Goyo<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>tf", ":Translate fr<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>tt", ":Translate ta<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>ts", ":Translate si<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>al", ":ALEToggle<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>ft", ":FloatermToggle<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>te", ":ToggleTerm<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>n", ":set number relativenumber cursorline<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>rn", ":set nonumber norelativenumber<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>wn", ":NewWriterFile<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>fzl", ":FzfLua files<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>fzg", ":FzfLua live_grep<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>fzm", ":FzfLua marks<CR>", { noremap = true, silent = true})

