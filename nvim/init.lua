--[[
	 _   _ _____ _____     _____ __  __ _ 
	| \ | | ____/ _ \ \   / /_ _|  \/  | |
	|  \| |  _|| | | \ \ / / | || |\/| | |
	| |\  | |__| |_| |\ V /  | || |  | |_|
	|_| \_|_____\___/  \_/  |___|_|  |_(_)
                                      
--]]
-- MAKE SURE TO RUN :PackerSync after getting this init.lua
-- Auto-install packer.nvim if not installed
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    print("Installing packer, close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Packer setup
local status, packer = pcall(require, 'packer')
if not status then
    return
end


packer.init()

packer.startup(function(use)
    use 'wbthomason/packer.nvim'  -- Manage itself
    use 'nvim-treesitter/nvim-treesitter'  -- Treesitter
	use 'MunifTanjim/nui.nvim' -- dependency for noice.nvim
	use 'rcarriga/nvim-notify' -- dependency for noice.nvim
	use 'folke/noice.nvim' -- noice.nvim
	use 'folke/tokyonight.nvim' -- colorscheme
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

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "python", "rust" },  -- Add more languages as needed
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- Enable true colors
vim.opt.termguicolors = true

-- values shown are defaults and will be used if not provided
--[[
require('gruvbox-material').setup({
  --italics = false,             -- enable italics in general
  contrast = "medium",        -- set contrast, can be any of "hard", "medium", "soft"
	comments = {
    italics = false,           -- enable italic comments
  },
  background = {
    transparent = false,      -- set the background to transparent
  },
  float = {
    force_background = false, -- force background on floats even when background.transparent is set
    background_color = nil,   -- set color for float backgrounds. If nil, uses the default color set
                              -- by the color scheme
  },
  signs = {
    highlight = true,         -- whether to highlight signs
  },
  customize = nil,            -- customize the theme in any way you desire, see below what this
                              -- configuration accepts
})
]]
-- lualine statusbar
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = {
		normal = {
			a = { fg = '#15161e', bg = "#7aa2f7" },
			b = { fg = '#c0caf5', bg = '#0e0e1a' },
			c = { fg = '#c0caf5', bg = '#0e0e1a' },
			x = { fg = '#c0caf5', bg = '#0e0e1a' },
			y = { fg = '#20212d', bg = '#5a77b4' },
		},
		insert = {
			a = { fg = '#15161e', bg = '#9ece6a' },
			y = { fg = '#20212d', bg = '#6d8f48' }
		},
		visual = {
			a = { fg = '#15161e', bg = '#ff9e64' },
			y = { fg = '#34261a', bg = '#a1613b' }
		},
	},
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
-- set the color scheme and its options
require("tokyonight").setup({
  style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = false },
    keywords = { italic = false },
    functions = { bold = false },
    variables = { bold = false },
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  dim_inactive = false, -- dims inactive windows

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights tokyonight.Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,

  cache = true, -- When set to true, the theme will be cached for better performance

  ---@type table<string, boolean|{enabled:boolean}>
  plugins = {
    -- enable all plugins when not using lazy.nvim
    -- set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    -- uses your plugin manager to automatically enable needed plugins
    -- currently only lazy.nvim is supported
    auto = true,
    -- add any plugins here that you want to enable
    -- for all possible plugins, see:
    --   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
    -- telescope = true,
    },
})
vim.cmd[[colorscheme tokyonight]]
-- Set custom highlight for variables and other syntax elements
vim.api.nvim_set_hl(0, '@variable', { fg = '#bb9af7' })
vim.api.nvim_set_hl(0, '@string', { fg = '#9ece6a' })
vim.api.nvim_set_hl(0, '@keyword.modifier', { fg = '#fab387' })
vim.api.nvim_set_hl(0, '@function.macro', { fg = '#7aa2f7' })
vim.api.nvim_set_hl(0, '@property', { fg = '#8f9dda' })
vim.api.nvim_set_hl(0, '@variable.member', { fg = '#ff9e64' })
--vim.api.nvim_set_hl(0, '@variable.member', { fg = '#74c7ec' })
--vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#f9e2af' })
--vim.api.nvim_set_hl(0, '@function.builtin', { fg = '#89b4fa' })
--vim.api.nvim_set_hl(0, '@operator', { fg = '#fab387' })
--vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#f9e2af' })
vim.api.nvim_set_hl(0, '@comment', { fg = '#3b4261' })



require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

-- Line numbers
vim.wo.number = true

-- Tab and indentation settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
-- Create an autocommand for VimLeave event
vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",  -- Trigger for all buffers
    callback = function()
        vim.opt.guicursor = ""  -- Equivalent to 'set guicursor='
        vim.fn.chansend(vim.v.stderr, "\x1b[ q")  -- Correct use of vim.v.stderr
    end
})
