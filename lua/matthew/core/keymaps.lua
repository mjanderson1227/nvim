vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("n", "<leader>bg", function()
	if vim.system({ "picom-trans", "-h" }, nil, nil):wait().code == 0 then
		vim.system({ "picom-trans", "-t", "-w", os.getenv("WINDOWID") })
	else
		vim.notify("Error: picom-trans is not installed on this device.", vim.log.levels.ERROR, nil)
	end
end, { desc = "Toggle [b]ack[g]round" })
