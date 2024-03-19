return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				ocaml = { "ocamlformat" },
				javascript = { { "prettierd", "prettier", "typescript-language-server" } },
				typescript = { { "prettierd", "prettier", "typescript-language-server" } },
				javascriptreact = { { "prettierd", "prettier", "typescript-language-server" } },
				typescriptreact = { { "prettierd", "prettier", "typescript-language-server" } },
				python = { "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
