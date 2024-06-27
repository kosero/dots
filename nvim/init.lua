vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'  
  use 'nvim-telescope/telescope.nvim' 
  use 'neovim/nvim-lspconfig'  

  use 'morhetz/gruvbox' 

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip' 
  use 'saadparwaiz1/cmp_luasnip'
  
  use 'IogaMaster/neocord'
  use {
    "Exafunction/codeium.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end
}
  use 'nvim-lualine/lualine.nvim'
end)

vim.o.number = true          
vim.o.expandtab = true       
vim.o.shiftwidth = 2         
vim.o.tabstop = 4
vim.o.smartindent = true     

vim.cmd [[colorscheme gruvbox]]

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    section_separators = '',
    component_separators = '',
  }
}
