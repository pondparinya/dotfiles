local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local mappings = require("plugins.configs.telescope.mappings")
local picker = require("plugins.configs.telescope.picker")
local extension = require("plugins.configs.telescope.extension")

local options = {
	extensions_list = {
		-- "file_browser",
	},
	defaults = {
		-- vimgrep_arguments = {
		-- 	"rg",
		-- 	"--color=never",
		-- 	"--no-heading",
		-- 	"--with-filename",
		-- 	"--line-number",
		-- 	"--column",
		-- 	"--smart-case",
		-- },

		prompt_prefix = " ",
		selection_caret = " ",
		mappings = mappings,
	},
  picker = picker,
	-- pickers = {
    -- find_files = {
      -- hidden = true
    -- }
  -- },
	extensions = extension,
}

telescope.setup(options)
-- load extensions
pcall(function()
	for _, ext in ipairs(options.extensions_list) do
		telescope.load_extension(ext)
	end
end)
