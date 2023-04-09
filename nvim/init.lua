-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.smartcase = true -- ignore case only with lowercase letters
vim.opt.wrap = true -- enable soft wrapping at the edge of the screen
vim.opt.linebreak = true -- don't wrap in the middle of a word
vim.opt.clipboard = "unnamedplus" -- set clipboard register to the system clipboard
