# Changelog

All notable changes to OVIWrite will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.5] - 2026-03-30

### Changed
- **BREAKING:** Minimum Neovim version updated to **0.10.0** (was 0.8.0)
  - 0.8 and 0.9 are no longer supported
  - See [Neovim 0.10 Migration Guide](https://github.com/neovim/neovim/wiki/release-0.10) for details
- Replaced deprecated `vim.loop` with `vim.uv` for file system operations
- Updated documentation for 2026 standards and best practices

### Added
- `MODERNIZATION_2026.md` - Comprehensive roadmap for modernization and future improvements
- `CONTRIBUTING.md` - Guidelines for new maintainers and contributors
- This `CHANGELOG.md` file for version tracking

### Fixed
- Removed deprecated Neovim APIs
- Improved plugin lazy-loading configurations

### Deprecated
- Neovim 0.8 and 0.9 support (minimum now 0.10.0)

### Security
- Updated plugin dependencies for security patches

## [0.4] - 2023-12-11

### Added
- Initial stable release with 60+ writing-focused plugins
- Support for LaTeX, Markdown, Org-Mode, and Fountain file formats
- Integrated spelling, grammar checking, and thesaurus tools
- Multi-platform support (Linux, macOS, Android)
- Multiple colorscheme options (Catppuccin, Gruvbox, NightFox)

### Features
- Distraction-free writing modes (Goyo, Zen Mode, Twilight)
- Personal knowledge management (Zettelkasten with vim-wiki)
- Version control integration with lazygit
- Screenwriting support with Fountain plugin
- Markdown and LaTeX preview capabilities

## [0.3] - 2022-12-11

### Added
- Org-mode support improvements
- Enhanced LSP integration
- Better keyboard shortcut organization with which-key

## [0.2] - 2022-12-11

### Added
- Vimkipedia note-taking system
- Expanded plugin ecosystem
- Better documentation

## [0.1] - 2021-11-01

### Added
- Initial release
- Core Neovim configuration for writers
- Foundation for plugin ecosystem

---

## Maintenance Notes

### For Current Maintainers
- See `MODERNIZATION_2026.md` for planned improvements
- See `CONTRIBUTING.md` for contribution guidelines
- Always test new plugin additions with actual writing workflows

### For Plugin Updates
- Test on both Neovim 0.10.0 LTS and latest (0.11+) versions
- Ensure lazy.nvim loading patterns are up to date
- Document any breaking changes in this file

### Platforms Tested
- ✅ Linux (Debian, Ubuntu-based, popOS)
- ✅ macOS (Sonoma 14.1.2+)
- ✅ Android 12+ (via Termux)
- ⚠️ Windows (documented but untested - contributions welcome)
- ❌ iPad (not tested)
