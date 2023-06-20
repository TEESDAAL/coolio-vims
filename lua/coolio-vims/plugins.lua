-- From https://github.com/wbthomason/packer.nvim#quickstart
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Auto close brackets
	use({"m4xshen/autoclose.nvim", config=function ()
    require("autoclose").setup()
	end})


	-- AI autocomplete
	use({ "codota/tabnine-nvim", run = "./dl_binaries.sh", config = function ()
    require('tabnine').setup({
      disable_auto_comment=true,
      accept_keymap="<Tab>",
      dismiss_keymap = "<C-]>",
      debounce_ms = 800,
      suggestion_color = {gui = "#808080", cterm = 244},
      exclude_filetypes = {"TelescopePrompt"},
      log_file_path = nil, -- absolute path to Tabnine log file
    })
	end })

	-- Nvim file tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
    config = function ()
      require("nvim-tree").setup()
    end
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
    "williamboman/mason-lspconfig.nvim",
    requires = {
      {
        "williamboman/mason.nvim",
        run = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = function ()
          require("mason").setup()
        end
      }
    },
    config = function()
      require("mason-lspconfig").setup()
    end
	})

  -- Get LSPs
  use({
    "neovim/nvim-lspconfig",
    config = function ()
      require("coolio-vims.config.lspconfig")
    end
  })

  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      -- Disable by default
      vim.diagnostic.config({ virtual_lines = false })
    end,
  })

  use 'lervag/vimtex'
end)
