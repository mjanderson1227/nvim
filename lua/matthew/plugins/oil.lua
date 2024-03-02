return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local oil = require("oil")
		oil.setup()
		vim.keymap.set("n", "<leader>-", oil.open, { desc = "Open current directory" })
	end,
}
