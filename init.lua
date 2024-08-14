require('config')


-- This is NeoVide Config

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here

   vim.o.guifont = "Hack Nerd Font Mono:h18" -- text below applies for VimScript
   vim.g.neovide_transparency = 0.8
   vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_background_color = 0xff1a1b26


if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_call_function("codeium#GetStatusString", {})


-- -- This fowr Skim and Latex syncing
-- vim.g.vimtex_view_method = 'skim'
-- vim.g.vimtex_view_skim_sync = 1
-- vim.g.vimtex_view_skim_activate = 1
--
-- -- Set up forward search
-- vim.g.vimtex_view_skim_reading_bar = 1
-- vim.g.vimtex_view_skim_sync_forward = 1
--
-- -- Ensure Skim is the default PDF viewer
-- vim.g.vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
-- vim.g.vimtex_view_general_options = '-r @line @pdf @tex'
end
--
--

