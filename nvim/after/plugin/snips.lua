local ls = require("luasnip")

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    --enable_autosnippets = true,
})

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

require("luasnip.session.snippet_collection").clear_snippets "c"

local snips = {
    all = {
    },
    lua = {
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
        )),
        s({ trig = "div", name = "Div Tag"},
        fmt(
        [[
        <div{}>
            {}
        </div>
        ]],
        { c(1, {{t' className="', i(1), t'"'}, t""}), i(0)}
        )),
        s({ trig = "csf", name = "Const Function"},
        fmt(
        [[
        const {} = ({}) => {{
            {}
        }}
        ]],
        { i(1), i(2), i(0)}
        ))
    },

    c = {
        s({ trig = "voidFunc", name = "Nextjs Boilerplate"},
        fmt(
        [[
            void {}(){{
                {}
            }}
        ]],
        { i(1, "funcName"), i(2)}
        )),

        s({ trig = "cfor", name = "C for loop"},
        fmt(
        [[
            for ({} {} = 0; {} < {}; {}++){{
                {}
            }}
        ]],
        { i(1, "int"), i(2, "i"), rep(2), i(3, "cnt"), rep(2), i(4)}
        )),
        s({trig = "main", name = "Main with args"},
        fmta(
        [[
        int main(int argc, char* argv) {
            <cursor>
            return 0;
        }
        ]]
        , {cursor = i(0)})),
    },

    cpp = {
        s({ trig = "CPBP", name = "Competitive Programming BP"},
        fmt(
        [[
            #include <bits/stdc++.h>

            using namespace std;

            int main(){{
                unsigned long long sum = 0;
                string str;
                cin >> str;

                {}

                return 0;
            }}
        ]],
        { i(1)}
        )),
    },
}

vim.api.nvim_set_keymap("i", "<C-d", "<Plug>luasnip_next_choice", {})
vim.api.nvim_set_keymap("s", "<C-d", "<Plug>luasnip_next_choice", {})
vim.api.nvim_set_keymap("i", "<C-r", "<Plug>luasnip_prev_choice", {})
vim.api.nvim_set_keymap("s", "<C-r", "<Plug>luasnip_prev_choice", {})

ls.add_snippets(nil, {
    all = snips.all,
    lua = snips.lua,
    typescriptreact = snips.javascript,
    javascriptreact = snips.javascript,
    javascript = snips.javascript,
    c = snips.c;
    cpp = snips.cpp;
})

