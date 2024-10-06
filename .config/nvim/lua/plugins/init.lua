return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
  },

  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      require "configs.coc"
    end,
  },

  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').load()
    end
  },

  { "nvim-lualine/lualine.nvim",
    opts = {
    	theme = theme,
		component_separators = '',
		section_separators = { left = '', right = '' }
	},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "vim", "lua", "vimdoc",
            "html", "css", "bash",
            "c", "cpp", "rust",
            "lua", "python", "nim"
        },
    },
  },

  { 'morhetz/gruvbox' },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    }
  },

  { 'norcalli/nvim-colorizer.lua' },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
        {'nvim-tree/nvim-web-devicons'}
    }
  },

  { 'andweeb/presence.nvim' },

  { "tpope/vim-fugitive" },

  { 'tanvirtin/vgit.nvim', requires = { 'nvim-lua/plenary.nvim' }},

  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  --{'windwp/nvim-autopairs'},
}
