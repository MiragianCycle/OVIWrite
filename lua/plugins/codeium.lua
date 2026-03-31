-- Codeium: Free AI code completion (optional)
-- Install: https://codeium.com/
-- This plugin provides free AI-powered code completion

return {
  "Exafunction/codeium.vim",
  enabled = false,  -- Set to true to enable Codeium
  event = "InsertEnter",
  config = function()
    -- Optional: Configure keybindings for Codeium
    vim.keymap.set("i", "<C-g>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, noremap = true })

    vim.keymap.set("i", "<c-;>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, noremap = true })

    vim.keymap.set("i", "<c-,>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, noremap = true })
  end,
}
