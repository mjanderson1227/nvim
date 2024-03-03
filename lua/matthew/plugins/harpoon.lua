return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		local pickers = require("telescope.pickers")
		local conf = require("telescope.config").values
		local finders = require("telescope.finders")

		harpoon:setup({})

		local function toggle(harpoon_files)
			local files = {}

			for _, file in ipairs(harpoon_files.items) do
				table.insert(files, file.value)
			end

			pickers
				.new({}, {
					prompt_title = "Harpoon",
					finder = finders.new_table({
						results = files,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end, { desc = "Harpoon [a]ppend" })

		vim.keymap.set("n", "<C-e>", function()
			toggle(harpoon:list())
		end, { desc = "Toggle Harpoon Menu" })

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end, { desc = "Select Harpoon File 1" })

		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end, { desc = "Select Harpoon File 2" })

		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(3)
		end, { desc = "Select Harpoon File 3" })

		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end, { desc = "Select Harpoon File 4" })

		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end, { desc = "Harpoon Next" })

		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end, { desc = "Harpoon Previous" })
	end,
}
