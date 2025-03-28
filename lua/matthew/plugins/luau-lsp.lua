return {
	"lopi-py/luau-lsp.nvim",
	opts = {
		...,
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("luau-lsp").setup({
			platform = {
				type = "roblox",
			},
			types = {
				roblox_security_level = "PluginSecurity",
			},
		})
	end,
}
