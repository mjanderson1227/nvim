return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "┊",
		},
		scope = {
			include = {
				node_type = { "return_statement", "table_constructor" },
			},
		},
	},
}
