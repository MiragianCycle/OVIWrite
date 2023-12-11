local opt =  vim.opt

-- Indentation

opt.smartindent = true 
opt.wrap = true


-- Search

opt.incsearch = true 
opt.ignorecase = true 
opt.smartcase = true
opt.hlsearch = false

-- Apperance 

opt.number = true 
opt.relativenumber = true
opt.termguicolors = true 
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10


-- Behaviour

opt.hidden = true 
opt.errorbells = false
--opt.backspace = "indent, eol, start" 
opt.splitright = true
opt.splitbelow = true 
opt.autochdir = false
opt.iskeyword:append( 'a' )
opt.clipboard: append( "unnamedplus")
opt.modifiable = true 
--opt.guicursor = true 
opt.encoding = "UTF-8" 
