# AI Integration Guide for OVIWrite

**Last Updated:** March 2026
**Status:** Complete Setup Guide

---

## Overview

OVIWrite includes modern AI integration for enhanced writing. You can use:

- **Claude (Anthropic)** - Advanced reasoning, best for serious writing
- **ChatGPT (OpenAI)** - General purpose, good for brainstorming
- **Codeium** - Free code completion
- **Ollama** - Local models (no API key needed)

---

## Option 1: Using Claude API (Recommended for Writers)

Claude is excellent for serious writing work: editing, rewriting, brainstorming, and structural feedback.

### Setup

1. **Get API Key**
   ```bash
   # Sign up at https://console.anthropic.com
   # Create an API key and copy it
   ```

2. **Set Environment Variable**
   ```bash
   # Add to ~/.bashrc, ~/.zshrc, or ~/.config/fish/config.fish

   # For bash/zsh:
   export ANTHROPIC_API_KEY="sk-ant-..."

   # For fish:
   set -gx ANTHROPIC_API_KEY "sk-ant-..."

   # Then reload your shell:
   source ~/.bashrc
   # or
   exec fish
   ```

3. **Configure in OVIWrite**
   - `gen.lua` is already set up to use Claude
   - Just set your API key (step 2) and it will work

### Usage

**In Normal or Visual Mode:**

```vim
<leader>ai    " Open AI prompt dialog
<leader>ac    " Start chat with AI
```

**Example Prompts for Writers:**

```
Improve the prose in this paragraph

Suggest three alternative ways to express this idea

Check this for grammar and style

Expand this outline into full paragraphs

Summarize this text in one sentence

Rewrite this in a more formal tone
```

### Cost

- **Pricing:** ~$0.003 per 1K input tokens, ~$0.015 per 1K output tokens
- **Typical writing session:** $1-5 USD
- **Compared to ChatGPT Plus:** Claude is cheaper and often better for writing

### Model Selection

OVIWrite uses Claude 3 Sonnet by default (good balance of speed and quality).

To use Claude 3 Opus (best quality, slower):
```lua
-- Edit lua/plugins/gen.lua
require("gen").setup({
  anthropic_model = "claude-3-opus",  -- Or "claude-3-sonnet"
})
```

---

## Option 2: Using ChatGPT (OpenAI)

Good for quick brainstorming and general writing assistance.

### Setup

1. **Get API Key**
   ```bash
   # Sign up at https://platform.openai.com
   # Go to API Keys and create one
   ```

2. **Set Environment Variable**
   ```bash
   export OPENAI_API_KEY="sk-..."
   ```

3. **Configure Model**
   ```bash
   # gen.lua already supports this - just set the key
   ```

### Usage

```vim
<leader>ai    " Open AI prompt
<leader>ac    " Chat mode
```

### Cost

- **GPT-4:** ~$0.05 per 1K input tokens
- **GPT-3.5-turbo:** ~$0.002 per 1K input tokens
- **Typical session:** $2-10 USD

---

## Option 3: Codeium (Free Code Completion)

Free AI code completion for programming sections.

### Setup

1. **Install Codeium**
   ```bash
   # OVIWrite has codeium.lua plugin
   # Edit lua/plugins/codeium.lua and set enabled = true
   ```

2. **Sign Up**
   - Visit https://codeium.com
   - Connect your GitHub account
   - No cost required (free tier)

3. **Auth in Neovim**
   ```vim
   :Codeium Auth
   ```

### Usage

```vim
<C-g>       " Accept Codeium suggestion
<C-;>       " Next suggestion
<C-,>       " Previous suggestion
```

### Cost

- **100% Free** (ad-supported)
- No API key needed
- Great for coding sections in OVIWrite

---

## Option 4: Local Models with Ollama (No API Key)

Run models locally on your machine (no internet, no API costs).

### Setup

1. **Install Ollama**
   ```bash
   # macOS: brew install ollama
   # Linux: https://ollama.ai/download
   # Windows: WSL2 + Linux instructions
   ```

2. **Download a Model**
   ```bash
   ollama pull mistral        # Fast, 7B model
   ollama pull neural-chat    # Good for writing
   ollama pull llama2         # Slower, 7B model
   ```

3. **Start Ollama Service**
   ```bash
   ollama serve
   # Runs on http://localhost:11434
   ```

4. **Configure OVIWrite**
   ```lua
   -- Edit lua/plugins/gen.lua
   require("gen").setup({
     model = "ollama",
     host = "http://localhost:11434",
     ollama_model = "mistral",  -- or neural-chat, llama2
   })
   ```

### Usage

Same as Claude/OpenAI:
```vim
<leader>ai    " Open AI prompt
<leader>ac    " Chat mode
```

### Recommended Models for Writing

| Model | Speed | Quality | VRAM | Best For |
|-------|-------|---------|------|----------|
| mistral | ⚡⚡⚡ | ⭐⭐⭐ | 4GB | Fast feedback |
| neural-chat | ⚡⚡ | ⭐⭐⭐⭐ | 4GB | Balanced |
| llama2 | ⚡ | ⭐⭐⭐ | 4GB | Accurate |

### Cost

- **Free** (runs on your computer)
- Uses local GPU/CPU
- No internet required
- No subscriptions

---

## Comparison Table

| Feature | Claude | ChatGPT | Codeium | Ollama |
|---------|--------|---------|---------|--------|
| **Cost** | Cheap | Expensive | Free | Free |
| **Writing Quality** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | N/A | ⭐⭐⭐ |
| **Speed** | Fast | Fast | Fast | Variable |
| **Internet Required** | Yes | Yes | Yes | No |
| **Easy Setup** | ✅ | ✅ | ✅ | Moderate |
| **Best Use Case** | Serious writing | Brainstorming | Code | Local privacy |

---

## Writing Workflow Examples

### Example 1: Editing with Claude

```vim
# Select a paragraph in visual mode
v (select text)

# Press <leader>ai to open prompt
<leader>ai

# Type your request:
Improve this prose for clarity and flow

# Claude suggests alternatives
# Accept or modify and insert
```

### Example 2: Brainstorming

```vim
# Go to a blank section
# Type your prompt:
<leader>ai

Generate 5 plot twists for a mystery novel

# Claude provides creative ideas
```

### Example 3: Grammar Checking

```vim
# Select text with grammar to check
v (select)

# Use Claude:
<leader>ai

Check for grammar, style, and clarity issues

# Get suggestions and apply
```

---

## Tips for Best Results

### 1. Write Clear Prompts

**Bad:** "fix this"
**Good:** "Improve this sentence for clarity and engage the reader"

### 2. Provide Context

**Bad:** "Rewrite this"
**Good:** "Rewrite this in the voice of a noir detective novel"

### 3. Use for Specific Tasks

- ✅ Grammar and style checking
- ✅ Brainstorming ideas
- ✅ Rewriting for different tones
- ✅ Expanding outlines
- ✅ Summarizing
- ❌ Creating entire novel from scratch (use as outline generator instead)

### 4. Combine with OVIWrite Features

```vim
# Outline creation -> claude brainstorming -> vale checking -> writing
# Markdown notes -> claude expand -> vimtex for PDF -> review -> publish
```

---

## Troubleshooting

### Gen.nvim doesn't work

1. Check environment variable is set:
   ```bash
   echo $OPENAI_API_KEY    # Should show your key
   ```

2. Test connection:
   ```bash
   curl https://api.openai.com/v1/models \
     -H "Authorization: Bearer $OPENAI_API_KEY"
   ```

3. Check plugin loaded:
   ```vim
   :Lazy
   # Look for gen.nvim - should show "loaded"
   ```

### Response is slow

- Using GPT-4? Try GPT-3.5-turbo (faster, cheaper)
- Using local Ollama? Your model might be large
- Network issue? Try again or check API status

### API Key not working

1. Verify key is correct (visit console.anthropic.com)
2. Check API key format: should start with `sk-ant-`
3. Reload shell after setting environment variable
4. For ChatGPT: verify in https://platform.openai.com/account/api-keys

### Feature not available

Some models don't support all features. Check:
- gen.nvim GitHub issues: https://github.com/David-Kunz/gen.nvim/issues
- Model compatibility in documentation

---

## Security Considerations

### Protecting Your API Key

✅ **Good:**
```bash
export OPENAI_API_KEY="sk-..."  # In ~/.bashrc (not shared)
```

❌ **Bad:**
```bash
echo "sk-..." >> init.lua  # Never hardcode in config
git commit api_key.txt      # Never commit to git
```

### Rate Limiting

Most providers limit requests. OVIWrite respects this:
- Claude: 50 requests/minute (free tier)
- OpenAI: Limits depend on plan
- Ollama: Unlimited (local)

### Privacy

- **Claude/OpenAI:** Your text is sent to their servers (encrypted)
- **Ollama:** Everything stays on your computer (private)

Choose Ollama if you're working with sensitive material.

---

## Advanced Configuration

### Using Custom Prompts

Edit `gen.lua` to add custom prompt templates:

```lua
require("gen").setup({
  prompts = {
    Edit_code = {
      prompt = "Edit the following code: $input",
      extract = "```$ftype\n(.-)```",
    },
    Expand_prose = {
      prompt = "Expand this into 3 paragraphs:\n$input",
      model = "openai",
    },
  }
})

-- Usage: :Gen Edit_code
```

### Switching Models Mid-Session

```vim
:GenModel claude        " Switch to Claude
:GenModel gpt-3.5-turbo " Switch to ChatGPT
:GenModel mistral       " Switch to local Ollama
```

### Chaining Requests

Process text through multiple AIs:

```vim
# Write initial draft
# Use Claude to improve prose
# Use local Ollama to check tone
# Use ChatGPT to brainstorm variations
```

---

## For Writers Using OVIWrite

### Recommended Setup

1. **Primary:** Claude (best for serious writing)
2. **Backup:** Local Ollama (privacy, cost savings)
3. **Coding:** Codeium (free, good for code sections)

### Monthly Budget (Recommended)

- **Claude:** $10-15 (2-3 writing sessions daily)
- **ChatGPT:** $20 (if using GPT-4)
- **Codeium:** Free
- **Ollama:** Free (electricity only)

### Sample Writing Workflow

```
1. Outline in org-mode
2. Draft paragraphs in Markdown
3. Use Claude: "Improve prose in this section"
4. Use Vale: `:Vale` for grammar check
5. Use Claude: "Make tone more engaging"
6. Export to LaTeX/PDF with `:VimtexCompile`
7. Review final output
```

---

## Learn More

- **Claude Docs:** https://docs.anthropic.com/
- **OpenAI Docs:** https://platform.openai.com/docs
- **gen.nvim:** https://github.com/David-Kunz/gen.nvim
- **Ollama Models:** https://ollama.ai/library

---

## Support

Having issues with AI integration?

1. Check troubleshooting section above
2. Review gen.nvim GitHub issues
3. Test API key independently
4. Verify OVIWrite version matches requirements

---

**Last Note:** AI is a tool for writers, not a replacement. Use it to enhance your writing, not to avoid the craft. Happy writing! ✍️
