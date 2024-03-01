return {
	'dccsillag/magma-nvim',
	config = function()
		vim.keymap.set('n', '<leader>r', ':MagmaEvaluateOperator<CR>', { silent = true, expr = true })
		vim.keymap.set('n', '<leader>rr', ':MagmaEvaluateLine<CR>', { silent = true })
		vim.keymap.set('x', '<leader>r', ':<C-u>MagmaEvaluateVisual<CR>', { silent = true })
		vim.keymap.set('n', '<leader>rc', ':MagmaReevaluateCell<CR>', { silent = true })
		vim.keymap.set('n', '<leader>rd', ':MagmaDelete<CR>', { silent = true })
		vim.keymap.set('n', '<leader>ro', ':MagmaShowOutput<CR>', { silent = true })
		vim.keymap.set('n', '<leader>rs', ':MagmaRestart<CR>', { silent = true })

		vim.g.magma_automatically_open_output = false
		vim.g.magma_image_provider = "ueberzug"
	end

}
