-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- OneDark Theme
    use 'navarasu/onedark.nvim'

    -- Telescope 
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- TreeSitter Highlighting & Parsing:
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    -- Harpoon Directory Navigation
    use('theprimeagen/harpoon')

    -- Undo Tree Change History
    use('mbbill/undotree')

    -- Vim Fugitive - Git Integration Plugin
    use('tpope/vim-fugitive')

    -- LSP-Zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    -- Code Minimap 
    use('wfxr/minimap.vim')

    -- Practice Movement
    use('ThePrimeagen/vim-be-good')

    -- GDB Integration
    use('sakhnik/nvim-gdb')

    -- Greeter
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }

    -- fd - Telescope Capability
    use('sharkdp/fd')

    -- Discord Rich Presence
    use('andweeb/presence.nvim')

    -- Ranger Integration
    use('kevinhwang91/rnvimr')

    -- Lualine Vim Theming
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- NeoTree File Viewing
    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- indent-blankline for rainbow highlighted tab spacing
    use "lukas-reineke/indent-blankline.nvim"

    -- Github copilot integration
    use("github/copilot.vim") 

    --  
    

end)
