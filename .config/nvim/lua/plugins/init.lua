local M = {}
function M.run()
	vim.cmd("packadd packer.nvim")

	local status_ok, packer = pcall(require, "packer")
	if not status_ok then
		return
	end
	local configs = require("core.packers").configs
	packer.init(configs)

	packer.startup(function(use)
		use({ "wbthomason/packer.nvim" })

		-- Dashboard
		use({
			"goolord/alpha-nvim",
			config = function()
				require("plugins.configs.alpha")
			end,
		})

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			config = function()
				require("plugins.configs.telescope2")
			end,
		})
		use({ "nvim-lua/plenary.nvim", module = "plenary" })
    use { "nvim-telescope/telescope-file-browser.nvim" }

		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("plugins.configs.project")
			end,
		})

		-- Commentary
		use({ "tpope/vim-commentary" })

		-- Nvim-tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- icons
			},
			config = function()
				require("plugins.configs.nvimtree")
			end,
		})

		-- Theme colors
		use({ "navarasu/onedark.nvim" })
		use({ "Mofiqul/dracula.nvim" })

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			module = "nvim-treesitter",
			setup = function()
				require("core.lazy_load").on_file_open("nvim-treesitter")
			end,
			cmd = require("core.lazy_load").treesitter_cmds,
			run = ":TSUpdate",
			config = function()
				require("plugins.configs.treesitter").setup()
			end,
		})

		-- Lsp stuff
		use({
			"williamboman/nvim-lsp-installer",
			cmd = require("core.lazy_load").lsp_cmds,
			setup = function()
				require("core.lazy_load").on_file_open("nvim-lsp-installer")
			end,
		})

		use({
			"neovim/nvim-lspconfig",
			after = "nvim-lsp-installer",
			module = "lspconfig",
			config = function()
				require("plugins.configs.lsp.lsp_configs")
			end,
		})

		-- Cmp
		use({ "rafamadriz/friendly-snippets", module = "cmp_nvim_lsp", event = "InsertEnter" })

		use({
			"hrsh7th/nvim-cmp",
			after = "friendly-snippets",
			config = function()
				require("plugins.configs.cmp").cmp_setup()
			end,
		})

		use({
			"L3MON4D3/LuaSnip",
			wants = "friendly-snippets",
			after = "nvim-cmp",
			config = function()
				require("plugins.configs.cmp").luasnip_setup()
			end,
		})

		use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })

		use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" })

		use({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" })

		use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })

		use({ "hrsh7th/cmp-path", after = "cmp-buffer" })

		-- Status Line
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("plugins.configs.status_lualine")
			end,
		})

		-- Tab Line
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.*",
			config = function()
				require("plugins.configs.tab_bufferline").setup()
			end,
		})
		use({ "moll/vim-bbye" })

		-- Indent-blankline
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("plugins.configs.blankline")
			end,
		})

		-- Gitsign
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("plugins.configs.gitsign").setup()
			end,
		})

		-- Formatting
		use({
			"mhartington/formatter.nvim",
			config = function()
				require("plugins.configs.formatting")
			end,
		})
	end)
end

return M
