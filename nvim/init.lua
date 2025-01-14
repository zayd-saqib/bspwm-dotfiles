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
			a = { fg = '#15161e', bg = "#7ca2f7" },
			b = { fg = '#c2caf5', bg = '#100d18' },
			c = { fg = '#c2caf5', bg = '#100d18' },
			x = { fg = '#c2caf5', bg = '#100d18' },
			y = { fg = '#20212d', bg = '#5c77b4' },
		},
		insert = {
			a = { fg = '#15161e', bg = '#9fce6a' },
			y = { fg = '#20212d', bg = '#6e8f48' }
		},
		visual = {
			a = { fg = '#15161e', bg = '#a486d7' },
			y = { fg = '#2a2137', bg = '#78639d' }
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
require("rose-pine").setup({
    variant = "moon", -- auto, main, moon, or dawn
    dark_variant = "moon", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },

    styles = {
        bold = false,
        italic = false,
        transparency = true,
    },

    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },

    palette = {
        -- Override the builtin palette per variant
        -- moon = {
        --     base = '#18191a',
        --     overlay = '#363738',
        -- },
    },

    highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
    },

    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
    end,
})
vim.cmd("colorscheme rose-pine")
--[[
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
vim.api.nvim_set_hl(0, '@variable', { fg = '#c4a7e7' })
vim.api.nvim_set_hl(0, '@string', { fg = '#9fce6a' })
vim.api.nvim_set_hl(0, '@keyword.modifier', { fg = '#fab387' })
vim.api.nvim_set_hl(0, '@function.macro', { fg = '#7aa2f7' })
vim.api.nvim_set_hl(0, '@property', { fg = '#a1a7d1' })
vim.api.nvim_set_hl(0, '@variable.member', { fg = '#ff9e64' })
vim.api.nvim_set_hl(0, "Title", { bold = false, fg = '#7aa2f7'}) -- for toml titles, etc
--vim.api.nvim_set_hl(0, '@variable.member', { fg = '#74c7ec' })
--vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#f9e2af' })
--vim.api.nvim_set_hl(0, '@function.builtin', { fg = '#89b4fa' })
--vim.api.nvim_set_hl(0, '@operator', { fg = '#fab387' })
--vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#f9e2af' })
vim.api.nvim_set_hl(0, '@comment', { fg = '#3e4261' }) -- set the color for comments
vim.api.nvim_set_hl(0, 'Comment', { fg = '#3e4261' }) -- set the color for comments
vim.api.nvim_set_hl(0, 'NonText', { fg = '#27243b' }) -- set the color for empty lines
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#27243b' }) -- set the color for line numbers



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
-- nvim notify options
require("notify").setup({
  background_colour = "#26233a",
})


-- Tab and indentation settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- disable line wrapping
vim.opt.wrap = false
-- this is for changing the cursor back to the i beam after exiting neovim.

-- Create an augroup named "Shape"
local shape_group = vim.api.nvim_create_augroup("Shape", { clear = true })

-- Define the autocommand for the VimLeave event
vim.api.nvim_create_autocmd("VimLeave", {
  group = shape_group,
  command = "set guicursor=a:ver90",
})
