return {
	"https://github.com/folke/lazydev.nvim",
	opts = {
		library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
	},
}
