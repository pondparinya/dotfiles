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
		-- Plugins Manager
		use({ "wbthomason/packer.nvim" })

		-- Notifiactions
		-- use({
		-- 	"rcarriga/nvim-notify",
		-- 	event = "VimEnter",
		-- 	config = function()
		-- 		require("plugins.configs.notify")
		-- 	end,
		-- })

		-- Dashboard
		-- STATUS / DONE
		use({
			"goolord/alpha-nvim",
			config = function()
				require("plugins.configs.alpha")
			end,
		})

		-- Which-key
		-- STATUS / PENDING
		use({
			"folke/which-key.nvim",
			config = function()
				require("plugins.configs.whichkey")
			end,
		})

		-- Terminal
		-- STATUS / PENDING
		use({
			"akinsho/toggleterm.nvim",
			cmd = "ToggleTerm",
			module = { "toggleterm", "toggleterm.terminal" },
			config = function()
				require("plugins.configs.toggleterm")
			end,
		})

		-- Autoparis
		-- STATUS / DONE
		use({
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = function()
				require("plugins.configs.autopairs")
			end,
		})

		-- Colorizer
		-- STATUS / DONE
		use({
			"norcalli/nvim-colorizer.lua",
			event = { "BufRead", "BufNewFile" },
			config = function()
				require("plugins.configs.colorizer")
			end,
		})
		-- Auto Close Tag
		-- STATUS / DONE
		use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

		-- Telescope
		-- STATUS / PENDING
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-telescope/telescope-file-browser.nvim" },
			config = function()
				require("plugins.configs.telescope.init")
			end,
		})
		use({ "nvim-lua/plenary.nvim", module = "plenary" })
		use({ "nvim-telescope/telescope-file-browser.nvim" })

		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("plugins.configs.project")
			end,
		})

		-- Commentary
		-- STATUS / DONE

		use({ "tpope/vim-commentary" })

		-- Nvim-tree
		-- STATUS / DONE
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
		-- STATUS / DONE
		use({ "navarasu/onedark.nvim" })
		use({ "Mofiqul/dracula.nvim" })

		-- Treesitter
		-- STATUS / DONE
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			event = { "BufRead", "BufNewFile" },
			-- cmd = {
			-- 	"TSInstall",
			-- 	"TSInstallInfo",
			-- 	"TSInstallSync",
			-- 	"TSUninstall",
			-- 	"TSUpdate",
			-- 	"TSUpdateSync",
			-- 	"TSDisableAll",
			-- 	"TSEnableAll",
			-- },
			config = function()
				require("plugins.configs.treesitter").setup()
			end,
		})

		-- Lsp stuff
		-- STATUS / DONE
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

		-- STATUS / PENDING
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
		-- STATUS / DONE
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("plugins.configs.status_lualine")
			end,
		})

		-- Tab Line
		-- STATUS / DONE
		use({
			"akinsho/bufferline.nvim",
			-- tag = "v2.*",
			config = function()
				require("plugins.configs.tab_bufferline").setup()
			end,
		})
		use({ "moll/vim-bbye" })

		-- Indent-blankline
		-- STATUS / DONE
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				require("plugins.configs.blankline")
			end,
		})

		-- Gitsign
		-- STATUS / PENDING
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("plugins.configs.gitsign").setup()
			end,
		})

		-- Formatting
		-- STATUS / DONE
		use({
			"mhartington/formatter.nvim",
			config = function()
				require("plugins.configs.formatting")
			end,
		})
	end)
end

return M
