-- From https://github.com/wbthomason/packer.nvim#quickstart
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Auto close brackets
	use("m4xshen/autoclose.nvim")

	-- AI autocomplete
	use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" })

	-- Nvim file tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})

	-- Tree sitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Git integration
	use("tpope/vim-fugitive")

	-- Theme
	use("rebelot/kanagawa.nvim")

	-- Commenting stuff
	use("tpope/vim-commentary")

	-- Autocomplete
	use("ms-jpq/coq_nvim")

	-- Get them binaries
	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})
end)
