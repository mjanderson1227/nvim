for _, client in ipairs(vim.lsp.get_clients({ name = "copilot" })) do
	client:stop()
end
