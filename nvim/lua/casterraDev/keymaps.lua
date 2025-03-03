vim.g.mapleader = ' '

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- Go back to netrw
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
-- Moves the cursor to the left/right of the text on the current line
vim.keymap.set({ "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x" }, "L", "g_")

-- When you are visual highlighted you can move the highlight lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Deletes the next newLine \n
vim.keymap.set("n", "J", "mzJ`z")
-- Goes half way down/up the page
vim.keymap.set("n", "<S-d>", "<C-d>zz")
vim.keymap.set("n", "<S-u>", "<C-u>zz")
-- Goes up/down when searching with / or ?
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever : Theprimeagen (Pastes and throws the line into the void delete so you keep your original copy)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- Puts into systems clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Void delete
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- Open another project using tmux : Theprimeagen
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Format the file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace word that cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/casterraDev/packer.lua<CR>");
-- Save the current file
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- Source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Diagonstic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {desc = "Go to previous [D]iagnostic message"})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {desc = "Go to next [D]iagnostic message"})
vim.keymap.set("n", "<leader>g", vim.diagnostic.open_float, {desc = "Show Diagnostic message"})
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {desc = "Show loclist"})
