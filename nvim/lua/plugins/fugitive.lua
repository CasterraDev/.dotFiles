return {
    'tpope/vim-fugitive',

    keys = {
        {"<leader>fgs", "<cmd>Git<cr>", "Open Fugitive" },
        {"<leader>fgp", "<cmd>Git Push<cr>", "Push with Fugitive" },
        {"<leader>fgP", "<cmd>Git Pull --rebase<cr>", "Pull with Fugitive" },
    }
}
