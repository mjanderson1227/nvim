vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "tmux.conf", ".tmux.conf" },
	callback = function(ctx)
		vim.lsp.start({
			name = "tmux-language-server",
			cmd = { "tmux-language-server" },
		})

		-- Disable diagnostics
		vim.diagnostic.disable(ctx.buf)
	end,
})
