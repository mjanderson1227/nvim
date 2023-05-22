vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pr", vim.cmd.RnvimrToggle)
vim.keymap.set("n", "<leader>nt", vim.cmd.Neotree)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>tt", vim.cmd.ToggleTerm)

-- Compile latex
vim.keymap.set("n", "<leader>cm", function()
    if string.find(vim.fn.expand("%"), ".tex") ~= nil then
        vim.cmd.write()
        vim.cmd("!pdflatex %")
        vim.api.nvim_feedkeys("<CR>", "n", true)
    else
        vim.cmd("echo 'ERROR: Not a tex file!'")
    end
end)

-- Compile latex with debug
vim.keymap.set("n", "<leader>dcm", function()
    if string.find(vim.fn.expand("%"), ".tex") ~= nil then
        vim.cmd.write()
        vim.cmd("!pdflatex %")
    else
        vim.cmd("echo 'ERROR: Not a tex file!'")
    end
end)
