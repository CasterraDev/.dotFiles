return {
    -- Fuzzy Finder
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.3',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    -- Themes
    ({
        'EdenEast/nightfox.nvim',
        name = 'nightfox'
    }),

    ({
        '0xstepit/flow.nvim',
        opts = {
            transparent = true,       -- Set transparent background.
            fluo_color = "pink",      --  Fluo color: pink, yellow, orange, or green.
            mode = "normal",          -- Intensity of the palette: normal, dark, or bright. Notice that dark is ugly!
            aggressive_spell = false, -- Display colors for spell check.
        }
    }),
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = true,
    },

    {
        'ej-shafran/compile-mode.nvim',
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- if you want to enable coloring of ANSI escape codes in
            -- compilation output, add:
            -- { "m00qek/baleia.nvim", tag = "v1.3.0" },
        },
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        opts = {
            columns = {
                -- "permissions",
                -- "size",
                -- "mtime",
                "icon"
            }
        },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },

    { 'nvim-treesitter/nvim-treesitter' },
    {
        'nvim-treesitter/playground',
        cmd = "TSPlaygroundToggle"
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

    'lervag/vimtex',

    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    { "rcarriga/nvim-dap-ui",           dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    'ldelossa/nvim-dap-projects',
    'theHamsta/nvim-dap-virtual-text',
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',

    'lewis6991/gitsigns.nvim',

    'mbbill/undotree',
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    {
        'numToStr/Comment.nvim',
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },
}
