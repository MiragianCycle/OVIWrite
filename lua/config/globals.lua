vim.g.mapleader = " "
vim.g.maplocalleader = " " 
vim.g.languagetool_server_command = '/opt/homebrew/bin/languagetool'



-- THIS SECTION IS FOR AUTOCOMMANDS
--
-- This is a autocommand for VimWiki
-- Create the autocommand group

vim.api.nvim_create_augroup("vimwiki_autocommands", { clear = true })

-- Function to save and convert to HTML
local function save_and_convert_to_html()
  -- Save the buffer
  vim.cmd('write')
  -- Trigger VimWiki2HTML
  vim.cmd('Vimwiki2HTML')
 -- Run sed command to update CSS reference
  vim.fn.system('sed -i "" -e "s/style\\.css/main\\.css/g" ~/vimwiki_html/*.html')
end

-- Create the autocommand
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "vimwiki_autocommands",
  pattern = "*.wiki",
  callback = save_and_convert_to_html
})

-- This one highlights yanked text for 250ms

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch" , timeout = 250 }
  end,
})




-- This one sets specific options for Fountain Type file

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fountain",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
    vim.opt_local.textwidth = 80
  end,
  group = vim.api.nvim_create_augroup("fountain_settings", { clear = true })
})

--
-- This one is a filetype autocommand for LaTeX documents

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    -- Set soft wrap with appropriate line breaks
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true

    -- -- Change colorscheme to catppuccin-mocha
    vim.cmd("colorscheme catppuccin-mocha")
    -- --
    -- -- Go to last editing position
    -- vim.api.nvim_create_autocmd("BufReadPost", {
    --   pattern = "*.tex",
    --   callback = function()
    --     local last_pos = vim.fn.line("'\"")
    --     if last_pos > 0 and last_pos <= vim.fn.line("$") then
    --       vim.api.nvim_win_set_cursor(0, {last_pos, 0})
    --     end
    --   end,
    --   once = true,
    -- })

    -- Invoke VimtexCompile
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.tex",
      callback = function()
        vim.cmd("VimtexCompile")
      end,
      once = true,
    })

    -- this one ensure SoftPencil is on
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.tex",
      callback = function()
        vim.cmd("SoftPencil")
      end,
    })


  end,
  group = vim.api.nvim_create_augroup("LaTeX_settings", { clear = true })
})

-- This one inserts a basic template into a new Wiki file
--
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.wiki",
  callback = function()
    -- Check if the file is empty
    if vim.fn.line('$') == 1 and vim.fn.getline(1) == '' then
      -- Insert the template
      local lines = {
        os.date("%Y-%m-%d"),  -- Current date and time
        "",
        "[[index]]",
        "",
        "[[Inbox]]",
        "",
      }
      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
      
      -- Save the file
      vim.cmd("write")
      
      -- Move cursor to the end of the file
      vim.cmd("normal G")
    end
  end,
  group = vim.api.nvim_create_augroup("wiki_template", { clear = true })
})

-- This one ensures that SoftPencil is on for every filetype of *.wiki
--
    -- this one ensure SoftPencil is on
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.wiki",
  callback = function()
    vim.cmd("SoftPencil")
  end,
})

-- this is for catppuccin-mocha on the wiki

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.wiki",
  callback = function()
    vim.cmd("colorscheme catppuccin-mocha")
  end,
})

-- The following ensure that Noice notifications are disabled when I enter a buffer of either *.tex or *.wiki

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.wiki",
  callback = function()
    vim.cmd("NoiceDisable")
  end,
})


vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.wiki",
  callback = function()
    vim.cmd("NoiceDismiss")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.tex",
  callback = function()
    vim.cmd("NoiceDismiss")
  end,
})




vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.tex", 
  callback = function()
    vim.cmd("NoiceDisable")
  end,
})

-- -- this is for Org files
--
-- -- this is for catppuccin-mocha on all Org Files
--
vim.api.nvim_create_autocmd("bufenter", {
  pattern = "*.org",
  callback = function()
    vim.cmd("colorscheme catppuccin-mocha")
  end,
})

--
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.org",
  callback = function()
    vim.cmd("NoiceDisable")
  end,
})


vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.org",
  callback = function()
    vim.cmd("NoiceDismiss")
  end,
})


vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.org",
  callback = function()
    vim.cmd("SoftPencil")
  end,
})


