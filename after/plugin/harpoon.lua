local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local terminal = require("harpoon.term")

-- Adding a new file to the harpoon:
vim.keymap.set("n", "<leader>a", mark.add_file)

-- Open Harpoon menu:
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- Quick File Navigation:
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)

-- Terminal Navigation:
vim.keymap.set("n", "<leader>t", function() terminal.gotoTerminal(1) end)
