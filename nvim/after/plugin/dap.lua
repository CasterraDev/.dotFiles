require('dapui').setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has("nvim-0.7"),
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
})
require('dap-go').setup()
require('nvim-dap-virtual-text').setup({});
local dap = require("dap")

vim.keymap.set("n", "<F5>", ":lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F10>", ":lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require('dap').repl.open()<CR>")

vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { noremap = true })

--local mason_registry = require('mason-registry')

--local codelldb = mason_registry.get_package("codelldb")
--local extension_path = codelldb:get_install_path() .. "/extension/"
--local codelldb_path = extension_path .. "adapter/codelldb"
--local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

dap.adapters.codelldb = {
    name = "codelldb",
    type = 'server',
    port = '13000',
    executable = {
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = { '--port', '13000' },
    },
}

-- get input on runtime
local get_program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin/", "file") end
local get_args = function() return vim.split(vim.fn.input('args: ', '', 'file'), ' ') end

dap.configurations.c = {
    {
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        cwd = '${workspaceFolder}',
        program = get_program,
        args = get_args,
        runInTerminal = false,
    }
}
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.cpp

--Add config path files for it to search
--require('nvim-dap-projects').config_paths = {"./test/nvim-dap.lua"}
require('nvim-dap-projects').search_project_config();

vim.fn.sign_define('DapBreakpoint',
  { text = '🛑', texthl = '', linehl = '', numhl = '' })
