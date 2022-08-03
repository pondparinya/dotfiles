local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	-- ignore_ft_on_setup = { "alpha" },
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	filters = {
		dotfiles = false,
	},
	view = {
		hide_root_folder = true,
		width = 30,
		height = 30,
		side = "left",
		mappings = {
			-- list = {
			-- 	{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
			-- 	{ key = "h", cb = tree_cb("close_node") },
			-- 	{ key = "v", cb = tree_cb("vsplit") },
			-- },
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		-- show_on_dirs = true,
		icons = {
			-- hint = "",
			-- info = "",
			-- warning = "",
			error = "",
		},
	},
})
