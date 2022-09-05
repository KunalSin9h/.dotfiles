return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'kyazdani42/nvim-web-devicons' 
    use 'rcarriga/nvim-notify'
    use 'nvim-lualine/lualine.nvim'   
    use 'akinsho/bufferline.nvim'    
    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'
    use 'nvim-neo-tree/neo-tree.nvim'
    use 'MunifTanjim/nui.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'akinsho/toggleterm.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    -- LSP
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    use 'onsails/lspkind.nvim' -- icons for autocomplete

    -- Lsp Installer
    use 'williamboman/nvim-lsp-installer'

    -- Java
    use 'mfussenegger/nvim-jdtls'

end)
