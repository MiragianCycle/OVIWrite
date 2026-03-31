-- gen.nvim: AI-powered code/text generation
-- Supports: OpenAI (ChatGPT), Claude, Ollama, and more
-- Setup: https://github.com/David-Kunz/gen.nvim

return {
  "David-Kunz/gen.nvim",
  event = "VeryLazy",
  config = function()
    require("gen").setup({
      -- Default model (can be "openai", "anthropic", "ollama", etc.)
      model = "openai",

      -- Display options
      display_mode = "split",  -- split, float, or replace
      show_prompt = true,
      show_model = true,

      -- OpenAI Configuration (set OPENAI_API_KEY environment variable)
      openai_api_key = os.getenv("OPENAI_API_KEY"),

      -- Anthropic Claude Configuration (set ANTHROPIC_API_KEY environment variable)
      anthropic_api_key = os.getenv("ANTHROPIC_API_KEY"),

      -- Use local Ollama models (no API key needed)
      -- Install Ollama: https://ollama.ai/
      -- Default models: mistral, llama2, neural-chat, etc.
    })

    -- Keymap: <leader>ai to use AI assistant
    vim.keymap.set({ "n", "v" }, "<leader>ai", "<cmd>Gen<CR>", { noremap = true, silent = true, desc = "AI Generate" })

    -- Keymap: <leader>ac to chat with AI
    vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>GenChat<CR>", { noremap = true, silent = true, desc = "AI Chat" })
  end,
}

