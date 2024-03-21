return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "┊",
			repeat_linebreak = false,
		},
		scope = {
			include = {
				node_type = { "return_statement", "table_constructor" },
			},
		},
	},
}
