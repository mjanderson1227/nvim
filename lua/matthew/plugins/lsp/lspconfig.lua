return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
		{
			"williamboman/mason.nvim",
			config = true,
		},
		{
			"j-hui/fidget.nvim",
			opts = {},
		},
	},
}
