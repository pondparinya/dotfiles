local extension = {}

local fb_actions = require("telescope").extensions.file_browser.actions

extension.file_browser = {
	theme = "ivy",
	initial_mode = "normal",
	-- disables netrw and use telescope-file-browser in its place
	hijack_netrw = true,
	mappings = {
		["i"] = {
			-- your custom insert mode mappings
		},
		["n"] = {
			-- your custom normal mode mappings
		},
	},
}

return extension
