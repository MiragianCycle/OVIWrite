-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.smartcase = true -- ignore case only with lowercase letters
vim.opt.wrap = true -- enable soft wrapping at the edge of the screen
vim.opt.linebreak = true -- don't wrap in the middle of a word
vim.opt.clipboard = "unnamedplus" -- set clipboard register to the system clipboard

-- init.lua

-- Load custom treesitter grammar for org filetype
require("orgmode").setup_ts_grammar()

-- Treesitter configuration
require("nvim-treesitter.configs").setup({
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = { "org" },
  },
  ensure_installed = { "org" }, -- Or run :TSUpdate org
})

require("orgmode").setup({
  org_agenda_files = { "~/Dropbox/org/*", "~/my-orgs/**/*" },
  org_default_notes_file = "~/Dropbox/org/refile.org",
})

local function getWords()
  return tostring(vim.fn.wordcount())
end
