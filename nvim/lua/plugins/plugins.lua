packer.startup(function(use)
    use 'wbthomason/packer.nvim'  -- Manage itself
    use 'nvim-treesitter/nvim-treesitter'  -- Treesitter
	use 'MunifTanjim/nui.nvim' -- dependency for noice.nvim
	use 'rcarriga/nvim-notify' -- dependency for noice.nvim
	use 'folke/noice.nvim' -- noice.nvim
	use 'folke/tokyonight.nvim' -- colorscheme
	use 'rose-pine/neovim' -- colorscheme rose pine
	use {
		'nvim-lualine/lualine.nvim',
	}
	--use 'f4z3r/gruvbox-material.nvim' --gruvbox
    	use 'nvim-treesitter/playground'  -- Optional Treesitter Playground
	use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
		}
    	use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup {
                view = { width = 20, side = 'left'},
            }
        end,
    }
end)

