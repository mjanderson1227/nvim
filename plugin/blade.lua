-- Module facilitates the setup of blade as its own filetype and treesitter grammar.
vim.api.nvim_create_augroup("BladeFileTypeRelated", {})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = "BladeFileTypeRelated",
	pattern = "*.blade.php",
	callback = function()
		vim.bo.filetype = "blade"
	end,
})

--- Register a custom treesitter entry for the blade grammar.
--- @diagnostic disable
vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	callback = function()
		require("nvim-treesitter.parsers").blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
		}
	end,
})

-- Bootstrap the grammar installation if it is not already installed.
require("nvim-treesitter").install({ "blade" })
