local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local mappings = require("plugins.configs.telescope.mappings")
local picker = require("plugins.configs.telescope.picker")
local extension = require("plugins.configs.telescope.extension")

local options = {
	extensions_list = {
		"file_browser",
	},
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		mappings = mappings,
	},
	-- pickers = picker,
	extensions = extension,
}

telescope.setup(options)
-- load extensions
pcall(function()
	for _, ext in ipairs(options.extensions_list) do
		telescope.load_extension(ext)
	end
end)
