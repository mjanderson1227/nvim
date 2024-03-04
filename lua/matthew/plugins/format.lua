return {
	"sbdchd/neoformat",
	config = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			command = "try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry",
		})
	end,
}
