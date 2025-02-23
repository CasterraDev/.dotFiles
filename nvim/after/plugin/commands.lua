function CreateCFile(args)
    --Get current working directory the nvim editor is in
    local rfp = vim.api.nvim_buf_get_name(0)
    --Remove the file from the full path. So you just have the dir path
    local fp = string.gsub(rfp, "/[^/]*$", "/")
    local file = io.open(fp .. args['args'] .. ".h", "w")
    if (file == nil) then
        return
    end
    file:write("#pragma once")
    file:close()

    local cfile = io.open(fp .. args['args'] .. ".c", "w")
    if (cfile == nil) then
        return
    end
    cfile:write("#include \"" .. args['args'] .. ".h\"")
    cfile:close()
end

--Create File C. Creates a header and C file with some BP
vim.api.nvim_create_user_command("Cfc", CreateCFile, { nargs='*' })

local function compileFromCustomString()
    local input = vim.fn.input("Compile: ")
    vim.g.COMPILESTRING = ":below Compile " .. input
    vim.cmd(vim.g.COMPILESTRING)
end

local function compileFromLastCommand()
    vim.cmd(vim.g.COMPILESTRING)
end

vim.keymap.set("n","<leader>ks", compileFromCustomString)
vim.keymap.set("n","<leader>kk", compileFromLastCommand)
