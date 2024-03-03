return {
	"nvim-neorg/neorg",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	run = ":Neorg sync-parsers",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {
				config = {
					folds = true,
					icon_preset = "basic",
				},
			},
			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
					name = "[Neorg]",
				},
			},
			["core.dirman"] = {
				config = {
					workspaces = {
						school = "~/notes/school",
						home = "~/notes/home",
						journal = "~/notes/journal",
					},
				},
			},
		},
	},
}
