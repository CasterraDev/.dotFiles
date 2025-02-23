return {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    lazy = false,
    opts = {
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = 'main',
        --- @usage 'main'|'moon'|'dawn'
        dark_variant = 'main',
        bold_vert_split = false,
        dim_inactive_windows = false,
        disable_background = false,
        disable_float_background = false,
        disable_italics = true,

        styles = {
            bold = false,
            italic = false,
            transparency = true,
        },

        --- @usage string hex value or named color from rosepinetheme.com/palette
        groups = {
            background = 'base',
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
        -- Change specific vim highlight groups
        -- https://github.com/rose-pine/neovim/wiki/Recipes
        highlight_groups = {
            ColorColumn = { bg = 'none' },

            -- Blend colors against the "base" background
            CursorLine = { bg = 'foam', blend = 10 },
            StatusLine = { fg = 'love', bg = 'love', blend = 10 },

            -- By default each group adds to the existing config.
            -- If you only want to set what is written in this config exactly,
            -- you can set the inherit option:
            Search = { bg = 'gold', inherit = false },

            TelescopeBorder = { fg = "highlight_high", bg = "none" },
            TelescopeNormal = { bg = "none" },
            TelescopePromptNormal = { fg = "iris", bg = "none" },
            TelescopeResultsNormal = { fg = "iris", bg = "none" },
            TelescopeSelection = { fg = "love", bg = "none" },
            TelescopeSelectionCaret = { fg = "iris", bg = "none" },
        }
    },

    config = function(spec)
        require('rose-pine').setup(spec.opts)
        vim.cmd('colorscheme rose-pine')

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        require('lualine').setup {
            options = {
                theme = "rose-pine",
            }
        }
    end,
}
