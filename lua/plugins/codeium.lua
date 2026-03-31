-- Codeium: Free AI code completion (optional)
-- Install: https://codeium.com/
-- This plugin provides free AI-powered code completion
-- Set enabled = true to activate

return {
  "Exafunction/codeium.vim",
  enabled = false,  -- Set to true to enable Codeium
  event = "InsertEnter",
  config = function()
    if vim.g.codeium_enabled ~= false then
      -- Configure keybindings for Codeium (only if enabled)
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, noremap = true })

      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, noremap = true })

      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, noremap = true })
    end
  end,
}
