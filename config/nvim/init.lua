local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.termguicolors=true
vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'

vim.opt.rtp:prepend(lazypath)

vim.wo.number = true

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 'andweeb/presence.nvim' },
  { "David-Kunz/gen.nvim" }, 
  { "nvim-lualine/lualine.nvim" },
  { "neoclide/coc.nvim", branch = "release" },
  { "nvim-treesitter/nvim-treesitter" },
  { "tpope/vim-fugitive" },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'morhetz/gruvbox' },
  { 'nvimdev/dashboard-nvim', event = 'VimEnter', dependencies = { {'nvim-tree/nvim-web-devicons'}} },
  { 'github/copilot.vim' },
  { 'norcalli/nvim-colorizer.lua' },
  { 'preservim/nerdtree' },
  { 'junegunn/fzf', run = function() vim.api.nvim_command('fzf#install()') end },
  { 'junegunn/fzf.vim', requires = { 'junegunn/fzf' } },
  { 'tanvirtin/vgit.nvim', requires = { 'nvim-lua/plenary.nvim' }}
})

-- Start NERDTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

require('lualine').setup  {
	options = {
    		theme = theme,
		component_separators = '',
  		--section_separators = { left = '', right = '' }, -- Commented out because gnome-terminal doesn't render them properly.
		section_separators = { left = '', right = '' }
	},
}

require('dashboard').setup {
    -- config
}

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
	pattern = {"*.nim"}, 
	command = "set filetype=nim"
})

require('nvim-treesitter.configs').setup {
	ensure_installed = { "c", "yaml", "lua", "bash", "python", "nim" },
	auto_install = true,
  	highlight = {
    		enable = true,
	}
}

vim.opt.shiftwidth = 4
vim.cmd.colorscheme('gruvbox')
--vim.cmd.colorscheme "catppuccin-mocha"

require("telescope").load_extension("ui-select")

-- vgit.nvim
require('vgit').setup()

require('colorizer').setup()
