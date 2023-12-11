local vim_modes = {
	n = "n",
	i = "i",
	v = "v",
}

local default_opts = {
	noremap = true,
	silent = true,
}

--- @param opts (table|nil)
--- @return table
local get_opts = function(opts)
	local all_opts = opts
	if all_opts == nil then
		all_opts = {}
	end
	for k, v in pairs(default_opts) do
		all_opts[k] = all_opts[k] or v
	end
	return all_opts
end

--- @param vimmode (string|nil)
--- @return string
local get_mode = function(vimmode)
	local modeString = vim_modes[vimmode]
	if modeString == nil then
		return "n"
	else
		return modeString
	end
end

--- @param command (string)
--- @return string
local get_cmd_string = function(command)
	return [[<cmd>]] .. command .. [[<CR>]]
end

--- @param keymaps string String
--- @param command string String
--- @param vimmode (string|nil)
--- @param options (table|nil)
--- @return nil
local mapkey = function(keymaps, command, vimmode, options)
	local mode = get_mode(vimmode)
	local lhs = keymaps
	local rhs = get_cmd_string(command)
	local opts = get_opts(options)
	vim.keymap.set(mode, lhs, rhs, opts)
end

return { mapkey = mapkey }
