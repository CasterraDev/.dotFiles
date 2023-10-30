local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local snips = {
    all = {
        s({ trig = "allBP", name = "Nextjs Boilerplate"},
        fmt(
        [[
        my ALLnextjs snippet = {};
        ]],
        { i(1, "value")}
        ))
    },
    lua = {
        s({ trig = "myCustom", name = "Protected Call" },
            fmt(
                [[
                    local ok = {};
                ]],
                { i(1, "name") }
            )
        )
    },
    javascript = {
        s({ trig = "nextBP", name = "Nextjs Boilerplate"},
        fmt(
        [[
        export default function {}(){{
            return(
                <>
                    {}
                </>
            )
        }}
        ]],
        { i(1, "funcName"), i(2)}
        ))
    },

    c = {
        s({ trig = "ClangBP", name = "Nextjs Boilerplate"},
        fmt(
        [[
            void {}(){{
                {}
            }}
        ]],
        { i(1, "funcName"), i(2)}
        ))
    },
}

vim.api.nvim_set_keymap("i", "<C-r", "<Plug>luasnip_next_choice", {})
vim.api.nvim_set_keymap("s", "<C-r", "<Plug>luasnip_next_choice", {})
vim.api.nvim_set_keymap("i", "<C-t", "<Plug>luasnip_prev_choice", {})
vim.api.nvim_set_keymap("s", "<C-t", "<Plug>luasnip_prev_choice", {})

ls.add_snippets(nil, {
    all = snips.all,
    lua = snips.lua,
    javascriptreact = snips.javascript,
    javascript = snips.javascript,
    c = snips.c;
})

