return {
    "ThePrimeagen/harpoon",
    name = "harpoon",
    branch = "harpoon2",
    dependencies = { { "nvim-lua/plenary.nvim" } },

    config = function()
        require("harpoon").setup()
    end,

    keys = {
        {"<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, "Open Menu"},
        {"<leader>a", function() require("harpoon"):list():add() end, "Add File To List"},
        {"<C-h>", function() require("harpoon"):list():select(1) end, "Switch to file 1"},
        {"<C-j>", function() require("harpoon"):list():select(2) end, "Switch to file 2"},
        {"<C-k>", function() require("harpoon"):list():select(3) end, "Switch to file 3"},
        {"<C-l>", function() require("harpoon"):list():select(4) end, "Switch to file 4"}
    }
}
