# OVIWrite 2026 Modernization Report

**Branch:** `modernize-2026`
**Date:** 2026-03-30
**Status:** Initial Assessment

## Executive Summary

OVIWrite is a Neovim-based Integrated Writing Environment (IWE) for writers. Last major update was Dec 11, 2023 (v0.4), with ongoing maintenance through Dec 2025. This document outlines recommendations for bringing the project to 2026 standards.

---

## Priority Areas for Modernization

### 1. **Neovim Version Requirements** 🔴 HIGH PRIORITY
**Current Status:** Requires Neovim >= 0.8.0

**2026 Standards:**
- Neovim 0.10+ is the current stable release (released Sep 2024)
- Neovim 0.11+ beta available
- **Recommendation:** Update minimum requirement to **0.10.0**
  - Better Lua stability
  - Improved LSP capabilities
  - Better terminal integration
  - Modern plugin ecosystem alignment

**Action Items:**
- [ ] Update README.md: change `>= 0.8.0` to `>= 0.10.0`
- [ ] Test all plugins with 0.10.0+
- [ ] Update CI/CD if present
- [ ] Document any breaking changes in CHANGELOG

---

### 2. **lazy.nvim Plugin Manager** 🟡 MEDIUM PRIORITY
**Current Status:** Using lazy.nvim (good choice, very current)

**2026 Standards:**
- Current lazy.nvim is well-maintained and modern
- **However:** Check for deprecated plugin patterns
- Some plugins may use old lazy loading syntax

**Action Items:**
- [ ] Audit all 60+ plugins for deprecated `requires` (should be `dependencies`)
- [ ] Ensure all plugins use modern lazy loading with `event`, `cmd`, `keys` patterns
- [ ] Remove any plugins with unmaintained status (>1 year without updates)

---

### 3. **Plugin Ecosystem Audit** 🟡 MEDIUM PRIORITY
**Current Status:** 60+ plugins, mix of maintenance levels

**Plugins Requiring Attention:**

| Category | Issue | Action |
|----------|-------|--------|
| **LSP/Completion** | `nvim-cmp` is current, but check dependencies | Update config to latest cmp-* sources |
| **Spelling** | `LanguageTool.lua` - verify maintained | Check if ltex-ls is still recommended |
| **Tree-sitter** | Deprecated in favor of native integration | Update nvim-treesitter config |
| **Colorschemes** | Multiple schemes (Catppuccin, Gruvbox, NightFox) | All are actively maintained ✅ |
| **Terminal** | `floaterm` vs `toggleterm` - consolidate? | Pick one, remove redundancy |
| **File Explorer** | `nvim-tree` is current ✅ | Already modern |
| **Telescope** | Locked at 0.1.3 (stable tag) | Consider updating to latest |

---

### 4. **Documentation & Accessibility** 🟡 MEDIUM PRIORITY
**Current Status:**
- Good README with feature list
- Installation instructions present
- Wiki exists but may be outdated

**Gaps for 2026:**
- [ ] No CHANGELOG documenting breaking changes
- [ ] README says version 0.4 (from Dec 2023) - update to 0.5
- [ ] Installation instructions could mention system requirements more clearly (Python, Node, LaTeX)
- [ ] Configuration examples could be more modern (show recent lazy.nvim patterns)
- [ ] No CONTRIBUTING.md for new maintainers

**Action Items:**
- [ ] Create/update CHANGELOG.md
- [ ] Add CONTRIBUTING.md for maintainers
- [ ] Update README version to 0.5
- [ ] Add troubleshooting section for common 2025-2026 issues
- [ ] Document AI integration options (Claude, ChatGPT, Copilot) if desired

---

### 5. **Lua Code Quality** 🟡 MEDIUM PRIORITY
**Current Observations:**
- Mix of Lua quality across plugins
- Some files have unused code/comments (e.g., Skim LaTeX syncing commented out in init.lua)
- Some plugins may have deprecated APIs

**Action Items:**
- [ ] Run `lua-language-server` diagnostics across all config files
- [ ] Add `stylua` formatter configuration (.stylua.toml)
- [ ] Add luacheck for linting
- [ ] Remove dead code and commented sections
- [ ] Modernize vim.loop usage (deprecated in 0.10+, use vim.uv instead)

---

### 6. **Deprecated APIs** 🟡 MEDIUM PRIORITY
**Current Finding:**
```lua
-- In lua/config/init.lua line 2:
if not vim.loop.fs_stat(lazypath) then  -- ⚠️ DEPRECATED
```

**Action Items:**
- [ ] Replace `vim.loop` with `vim.uv` throughout codebase
- [ ] Update other deprecated APIs:
  - `vim.fn.system()` → modern alternatives where applicable
  - Check for deprecated plugin APIs

---

### 7. **External Dependencies** 🟡 MEDIUM PRIORITY
**Current Requirements:**
- Neovim >= 0.8.0 ✅
- Git >= 2.19.0 ✅ (old but still fine)
- Nerd Font (optional, recommended) ✅
- LaTeX compiler ✅
- Pandoc ✅

**2026 Considerations:**
- Consider adding Python 3.10+ (for language servers)
- Document Node.js 18+ (for some LSPs)
- Document platform-specific setup (Windows WSL vs native)

---

### 8. **Windows & Platform Support** 🟠 LOW-MEDIUM PRIORITY
**Current Status:**
- Linux ✅ (tested)
- macOS ✅ (tested, Sonoma noted)
- Android ✅ (Termux tested)
- iPad ❌ (not tested)
- Windows ⚠️ (not tested)

**2026 Opportunities:**
- [ ] Add Windows 11 specific documentation
- [ ] Test and document WSL2 setup
- [ ] Add ARM64 Mac (Apple Silicon) testing notes
- [ ] Consider iPad support (Neovim ports exist)

---

### 9. **Missing Modern Features** 🟠 LOW PRIORITY
**Suggested Additions for 2026:**

| Feature | Plugin | Status |
|---------|--------|--------|
| **AI Integration** | cmp-ai, gen.lua (exists) | Modernize gen.lua config |
| **Copilot/Codeium** | codeium is partially set up | Complete integration, add docs |
| **Markdown Live Preview** | markdown-preview (exists) | Works, but could document better |
| **Obsidian Integration** | obsidianNvim (exists) | Document workflow |
| **Collaborative Editing** | Not present | Consider adding (e.g., vim-concurrent) |

---

### 10. **Testing & CI/CD** 🔴 HIGH PRIORITY (New)
**Current Status:** No test framework, no CI/CD

**Recommended Additions:**
- [ ] Add GitHub Actions workflow for:
  - Syntax checking (stylua, luacheck)
  - Plugin loading test
  - Documentation validation
- [ ] Create simple test suite for critical features
- [ ] Add installation test in CI

---

## Implementation Roadmap

### Phase 1: Foundation (Week 1-2)
- [ ] Update Neovim minimum version to 0.10.0
- [ ] Replace vim.loop with vim.uv
- [ ] Update README version to 0.5
- [ ] Add CHANGELOG.md
- [ ] Add CONTRIBUTING.md

### Phase 2: Plugin Modernization (Week 2-3)
- [ ] Audit all plugins for deprecated patterns
- [ ] Update telescope, telescope, and key plugins
- [ ] Test on Neovim 0.10.0+ and 0.11 beta
- [ ] Remove unmaintained plugins

### Phase 3: Quality & Testing (Week 3-4)
- [ ] Set up stylua + luacheck
- [ ] Add GitHub Actions CI
- [ ] Create installation verification script
- [ ] Update documentation

### Phase 4: Enhanced Features (Week 4+)
- [ ] Modernize AI integration (Claude, ChatGPT, Copilot)
- [ ] Add more writing-focused LSP options
- [ ] Explore Obsidian sync improvements
- [ ] Add collaborative editing support

---

## Quick Wins (Can Do Immediately)

1. **Update README**
   - Change version from 0.4 to 0.5
   - Update Neovim requirement
   - Add 2026 platform notes

2. **Fix vim.loop Deprecation**
   ```lua
   -- OLD: if not vim.loop.fs_stat(lazypath) then
   -- NEW: if not vim.uv.fs_stat(lazypath) then
   ```

3. **Add CHANGELOG.md**
   - Document version 0.5 updates
   - List breaking changes
   - Ease adoption

4. **Remove Dead Code**
   - Skim LaTeX syncing comments in init.lua
   - Unused imports in plugin files
   - Duplicate plugin configurations

5. **Add Contributing Guidelines**
   - Explain plugin addition process
   - Document code style (stylua)
   - Link to Neovim plugin best practices

---

## Notes for New Maintainers

- **Scope**: OVIWrite is specifically for **writers** - keep plugin selection focused on prose, screenwriting, PKM
- **Philosophy**: "Do one thing well" - avoid bloat, remove features without clear use case
- **Testing**: Always test new plugins with actual writing workflows (LaTeX, Markdown, Fountain)
- **Community**: Small but dedicated user base - responsive maintenance matters
- **Dependencies**: Balance between stability (older Neovim support) and modernity (cutting-edge plugins)

---

## References

- [Neovim 0.10 Release](https://github.com/neovim/neovim/releases/tag/v0.10.0)
- [lazy.nvim Migration Guide](https://github.com/folke/lazy.nvim#-migration-guide)
- [Neovim Lua Best Practices](https://neovim.io/doc/user/lua.html)
- [vim.uv Migration](https://github.com/neovim/neovim/wiki/migrate-to-vim.uv)
- [Original OVIWrite Repository](https://github.com/MiragianCycle/OVIWrite)

---

## Summary Table

| Area | Current | Target | Priority | Effort |
|------|---------|--------|----------|--------|
| Neovim Version | 0.8.0+ | 0.10.0+ | HIGH | Low |
| lazy.nvim | Current | Audit | MEDIUM | Medium |
| Plugins | 60+ mixed | Audit + modernize | MEDIUM | High |
| Documentation | Good | Better | MEDIUM | Medium |
| Lua Quality | Fair | Excellent | MEDIUM | High |
| Testing/CI | None | Basic | HIGH | Medium |
| Windows Support | Untested | Documented | LOW | Low |

**Overall Status:** Ready for modernization. Solid foundation, needs targeted updates for 2026 standards.
