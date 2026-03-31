-- OVIWrite Luacheck Configuration
-- Code linting rules for quality assurance

std = "lua51+vim"

files["lua/plugins"] = {
  ignore = {
    "212", -- Unused variable
    "542", -- Empty statement
  }
}

files["lua/config"] = {
  ignore = {
    "212", -- Unused variable
    "542", -- Empty statement
  }
}

-- Global Vim/Neovim APIs
globals = {
  "vim",
  "OVERRIDES",
}

-- Allow standard library
not_globals = {
  -- None - allow all standard library
}

-- Line length (information only, not enforced)
max_line_length = 100

-- Readability
self = true  -- Report issues with unused self in methods

-- Don't report errors in certain patterns
exclude_files = {
  ".git/",
  "lazy/",
  "vendor/",
}
