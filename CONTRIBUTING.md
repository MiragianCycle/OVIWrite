# Contributing to OVIWrite

Thank you for your interest in contributing to OVIWrite! This document provides guidelines and information for contributors.

## About OVIWrite

OVIWrite is an **Integrated Writing Environment (IWE)** built on Neovim, specifically designed for **writers** (novelists, screenwriters, academics, journalists, etc.). All contributions should align with this core purpose.

## Code of Conduct

- Be respectful and inclusive
- Focus on the craft of writing and the tools that support it
- Help newer Vim/Neovim users—everyone started somewhere
- Test your contributions thoroughly

## Types of Contributions

### 🐛 Bug Reports
- Use GitHub Issues with the `bug` label
- Include your Neovim version (`nvim --version`)
- Describe steps to reproduce
- Specify which writing mode(s) are affected (LaTeX, Markdown, Fountain, etc.)

### ✨ Feature Requests
- Use GitHub Issues with the `enhancement` label
- Explain the writing workflow that would benefit
- Provide examples of how it improves the writing process
- Consider: Does this benefit our core audience (writers)?

### 📚 Documentation
- Update README.md if adding/changing features
- Keep CHANGELOG.md up to date with your changes
- Add comments to complex Lua configurations
- Update plugin tables if plugin list changes

### 🔧 Code Contributions
- Follow the guidelines below
- Test on Neovim 0.10.0+ (minimum required version)
- Add brief commit messages explaining the "why"
- Keep changes focused (one feature/fix per PR)

## Plugin Addition Guidelines

OVIWrite aims to curate a **minimal, focused set** of plugins for writers. Before proposing a new plugin, consider:

### Questions to Ask
1. **Does this directly support writing?** (prose, screenplays, note-taking, PKM)
2. **Is there already a plugin doing something similar?** If yes, why is this better?
3. **Is it actively maintained?** Check GitHub: recent commits, open issues, response time
4. **Will it conflict with existing plugins?** Check keymap assignments, LSP setup
5. **Does it have minimal dependencies?** Avoid bloat
6. **Is documentation clear?** Can writers easily understand how to use it?

### Plugin Status Requirements
- **Must:** Be actively maintained (commits in last 6 months)
- **Must:** Have clear documentation
- **Should:** Support Neovim 0.10.0+
- **Should:** Use modern lazy.nvim loading patterns (`event`, `cmd`, `keys`)
- **Optional but nice:** Have a helpful plugin author (responsiveness to issues)

### Example: Adding a New Plugin

```lua
-- lua/plugins/example-plugin.lua

return {
  "author/example-plugin",
  event = "BufReadPost",  -- Lazy load when opening a file
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- Configuration here
  },
  config = function(_, opts)
    require("example-plugin").setup(opts)
  end,
}
```

**Process:**
1. Create a new file: `lua/plugins/plugin-name.lua`
2. Follow the lazy.nvim spec
3. Add entry to plugin table in README.md
4. Update CHANGELOG.md
5. Test thoroughly with actual writing
6. Open PR with clear description of why this benefits writers

## Code Style

### Lua Formatting
Use [stylua](https://github.com/JohnnyMorganz/StyLua) for consistent formatting.

```bash
# Install stylua
cargo install stylua

# Format all Lua files
stylua lua/
```

### Naming Conventions
- `local function_name()` for local functions
- `local config = function()` for setup functions
- Use descriptive names (prefer clarity over brevity)

### Best Practices
- Keep functions small and focused
- Add comments for non-obvious logic
- Use vim.opt for options (not vim.o for config)
- Lazy load plugins when possible
- Avoid global state when possible

### Deprecation Policy
OVIWrite follows Neovim's deprecation cycle:
- When Neovim releases a major version, we update to support it
- We maintain support for the current LTS and two previous versions
- Current (2026): Support 0.10 LTS, 0.11, and work toward next LTS

## Testing Your Changes

### Manual Testing
1. **Test with real writing:**
   - Create a test `.md` file
   - Create a test `.tex` file (if LaTeX plugins)
   - Create a test `.fountain` file (if screenwriting)
   - Verify your feature/fix works in practice

2. **Test on clean installation:**
   ```bash
   # Back up your config
   cp -r ~/.config/nvim ~/.config/nvim.bak

   # Clone your branch
   git clone -b your-branch-name https://github.com/your-fork/OVIWrite.git ~/.config/nvim

   # Test in a fresh Neovim instance
   nvim
   ```

3. **Check for conflicts:**
   - Verify all plugins load without errors (`:Lazy`)
   - Check for keymap conflicts (`:map` or `:which` for `<leader>`)
   - Test file navigation and search features

### Automated Testing
We use GitHub Actions for:
- Lua syntax validation with `luacheck`
- Code formatting with `stylua`
- Plugin loading verification
- Documentation validation

## Before Submitting a PR

- [ ] I've tested this on Neovim 0.10.0+
- [ ] I've tested this with actual writing (not just code editing)
- [ ] I've formatted code with `stylua` (if applicable)
- [ ] I've updated README.md (if adding/changing features)
- [ ] I've updated CHANGELOG.md with an entry
- [ ] I've added comments to explain non-obvious logic
- [ ] I've removed debug code and console.logs
- [ ] My PR description explains the "why" not just the "what"

## Commit Message Guidelines

Write clear, descriptive commit messages:

```
Add Claude API integration for AI-assisted writing

- Integrate claude-ai plugin for writing suggestions
- Add keymaps for quick AI feedback on prose
- Document configuration in README

Closes #123
```

**Format:**
- First line: Present tense, clear action (Add/Fix/Update/Remove)
- Body: Explain motivation and impact
- Mention related issues (Closes #123, Relates to #456)

## Directory Structure

```
OVIWrite/
├── lua/
│   ├── config/          # Core configuration
│   │   ├── init.lua     # Bootstrap
│   │   ├── options.lua  # Neovim options
│   │   ├── keymaps.lua  # Key bindings
│   │   └── globals.lua  # Global variables
│   └── plugins/         # Plugin specifications
│       ├── init.lua     # Plugin list
│       └── *.lua        # Individual plugins
├── init.lua             # Entry point (Neovide config)
├── README.md            # User documentation
├── CHANGELOG.md         # Version history
├── MODERNIZATION_2026.md # Modernization roadmap
└── CONTRIBUTING.md      # This file
```

## Getting Help

- **Neovim Questions:** [Neovim Discourse](https://neovim.discourse.group/)
- **Plugin Development:** Check the plugin's GitHub repo
- **Writing Workflows:** Open a discussion in OVIWrite Issues
- **Lua Help:** [Lua 5.1 Manual](https://www.lua.org/manual/5.1/)

## Questions?

Open a GitHub Discussion or Issue with the `question` label. The OVIWrite community is here to help!

## Recognition

Contributors will be recognized in:
- CHANGELOG.md (credited in version notes)
- Project README (contributors section, if applicable)
- GitHub contributors graph

Thank you for improving OVIWrite! 🎉
