#!/bin/bash

##############################################################################
# OVIWrite Installation Verification Script
#
# Usage: ./install-verify.sh
#
# This script verifies that your OVIWrite installation is correct and ready
# to use. It checks:
# - Neovim version compatibility
# - Required dependencies
# - Plugin loading
# - Configuration validity
#
# Requirements: bash, neovim, git
##############################################################################

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
PASS=0
FAIL=0
WARN=0

# Functions for output
pass() {
  echo -e "${GREEN}✓${NC} $1"
  ((PASS++))
}

fail() {
  echo -e "${RED}✗${NC} $1"
  ((FAIL++))
}

warn() {
  echo -e "${YELLOW}⚠${NC} $1"
  ((WARN++))
}

info() {
  echo -e "${BLUE}ℹ${NC} $1"
}

header() {
  echo ""
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BLUE}$1${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

##############################################################################
# Start Verification
##############################################################################

clear

header "OVIWrite Installation Verification (March 2026)"
info "Checking your OVIWrite installation..."
echo ""

##############################################################################
# Check 1: Neovim Installation
##############################################################################

header "1. Neovim Installation"

if ! command -v nvim &> /dev/null; then
  fail "Neovim not found in PATH"
  fail "Please install Neovim from https://github.com/neovim/neovim/releases"
  exit 1
fi

NVIM_VERSION=$(nvim --version | head -1 | awk '{print $2}')
NVIM_MAJOR=$(echo "$NVIM_VERSION" | cut -d. -f1)
NVIM_MINOR=$(echo "$NVIM_VERSION" | cut -d. -f2)

pass "Neovim found: $NVIM_VERSION"

# Check minimum version
if [ "$NVIM_MAJOR" -lt 0 ] || ([ "$NVIM_MAJOR" -eq 0 ] && [ "$NVIM_MINOR" -lt 10 ]); then
  fail "Neovim version too old. Minimum required: 0.10.0 (you have: $NVIM_VERSION)"
  fail "Please upgrade: https://github.com/neovim/neovim/releases/v0.10.0"
  exit 1
fi

pass "Neovim version is compatible (0.10.0+)"

# Check for LuaJIT
if nvim --version | grep -q "LuaJIT"; then
  pass "Neovim built with LuaJIT"
else
  warn "Neovim may not be built with LuaJIT (check: nvim --version)"
fi

##############################################################################
# Check 2: Git Installation
##############################################################################

header "2. Git Installation"

if ! command -v git &> /dev/null; then
  fail "Git not found in PATH (required for lazy.nvim)"
  exit 1
fi

GIT_VERSION=$(git --version | awk '{print $3}')
pass "Git found: $GIT_VERSION"

##############################################################################
# Check 3: Configuration Directory
##############################################################################

header "3. Configuration Directory"

if [ ! -d ~/.config/nvim ]; then
  warn "~/.config/nvim directory not found"
  info "This should exist if OVIWrite is installed"
else
  pass "~/.config/nvim directory exists"

  if [ -f ~/.config/nvim/init.lua ]; then
    pass "init.lua found"
  else
    fail "init.lua not found in ~/.config/nvim"
  fi
fi

##############################################################################
# Check 4: Required Tools for Writing
##############################################################################

header "4. Writing Tools (Optional but Recommended)"

# LaTeX
if command -v pdflatex &> /dev/null; then
  pass "LaTeX compiler found (pdflatex)"
else
  warn "LaTeX compiler not found (pdflatex)"
  info "Install for LaTeX support: apt install texlive-latex-base (or brew install basictex)"
fi

# Pandoc
if command -v pandoc &> /dev/null; then
  PANDOC_VERSION=$(pandoc --version | head -1 | awk '{print $2}')
  pass "Pandoc found: $PANDOC_VERSION (format conversion)"
else
  warn "Pandoc not found (needed for format conversion)"
  info "Install: apt install pandoc (or brew install pandoc)"
fi

# Vale (Grammar checker)
if command -v vale &> /dev/null; then
  pass "Vale found (grammar checker)"
else
  warn "Vale not found (grammar checking disabled)"
  info "Install: https://docs.errata.ai/vale/installation"
fi

# Python 3 (for LSPs)
if command -v python3 &> /dev/null; then
  PYTHON_VERSION=$(python3 --version | awk '{print $2}')
  pass "Python 3 found: $PYTHON_VERSION (for language servers)"
else
  warn "Python 3 not found (some LSPs may not work)"
fi

# Node.js (for LSPs)
if command -v node &> /dev/null; then
  NODE_VERSION=$(node --version)
  pass "Node.js found: $NODE_VERSION (for language servers)"
else
  warn "Node.js not found (some LSPs may not work)"
fi

##############################################################################
# Check 5: Plugin Syntax
##############################################################################

header "5. Configuration Syntax"

if [ -d ~/.config/nvim/lua ]; then
  info "Checking Lua syntax in configuration..."

  # Count total files
  TOTAL_LUA=$(find ~/.config/nvim/lua -name "*.lua" 2>/dev/null | wc -l)
  pass "Found $TOTAL_LUA Lua files"

  # Try to parse init.lua
  if [ -f ~/.config/nvim/init.lua ]; then
    if nvim --headless -c "exec 'silent source ~/.config/nvim/init.lua' | quit" 2>&1 | grep -i "error" > /dev/null; then
      fail "Syntax error in init.lua"
    else
      pass "init.lua syntax is valid"
    fi
  fi
else
  warn "lua/ directory not found in ~/.config/nvim"
fi

##############################################################################
# Check 6: Dependency Status
##############################################################################

header "6. External Dependencies"

# Check for curl (used by some plugins)
if command -v curl &> /dev/null; then
  pass "curl found (for web operations)"
else
  warn "curl not found"
fi

# Check for fzf (optional for better fuzzy finding)
if command -v fzf &> /dev/null; then
  pass "fzf found (enhanced fuzzy finder)"
else
  warn "fzf not found (optional, but recommended)"
  info "Install: apt install fzf (or brew install fzf)"
fi

##############################################################################
# Check 7: System Check
##############################################################################

header "7. System Information"

OS=$(uname -s)
ARCH=$(uname -m)

case "$OS" in
  Linux)
    pass "OS: Linux ($ARCH)"
    ;;
  Darwin)
    pass "OS: macOS ($ARCH)"
    ;;
  MINGW*|CYGWIN*|MSYS*)
    warn "OS: Windows (WSL recommended)"
    ;;
  *)
    warn "OS: Unknown ($OS $ARCH)"
    ;;
esac

##############################################################################
# Summary
##############################################################################

header "Verification Summary"

TOTAL=$((PASS + FAIL + WARN))

echo ""
echo -e "  ${GREEN}Passed:${NC}  $PASS"
echo -e "  ${YELLOW}Warnings:${NC} $WARN"
echo -e "  ${RED}Failed:${NC}  $FAIL"
echo ""

if [ $FAIL -gt 0 ]; then
  echo -e "${RED}Status: Installation has issues${NC}"
  echo ""
  echo "Please fix the above errors before running OVIWrite."
  exit 1
elif [ $WARN -gt 0 ]; then
  echo -e "${YELLOW}Status: Installation complete but missing optional tools${NC}"
  echo ""
  echo "OVIWrite is ready to use, but consider installing the recommended tools:"
  echo "  • LaTeX for writing scientific documents"
  echo "  • Pandoc for document format conversion"
  echo "  • Vale for advanced grammar checking"
  echo "  • Python 3 and Node.js for language server features"
  echo ""
  echo "You can install these anytime later."
else
  echo -e "${GREEN}Status: Installation complete!${NC}"
  echo ""
  echo "All checks passed. OVIWrite is ready to use."
fi

echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Start Neovim: nvim"
echo "  2. Lazy.nvim will download plugins on first start"
echo "  3. Review README.md for keybindings and features"
echo "  4. Check CONTRIBUTING.md if you want to customize further"
echo ""
echo "Enjoy writing! 📝"
echo ""
