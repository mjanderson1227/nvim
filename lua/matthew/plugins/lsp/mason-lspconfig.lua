local border = {
	{ "┌", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "┐", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "┘", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "└", "FloatBorder" },
	{ "│", "FloatBorder" },
}

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

local servers = {
	clangd = {},
	-- gopls = {},
	pyright = {},
	rust_analyzer = {
		rustfmt = {
			rangeFormatting = { enable = true },
		},
	},
	tsserver = {
		format = true,
	},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim", "it", "should", "describe" },
				diagnostics = { disable = { "missing-fields" } },
			},
		},
	},
	cssls = {
		css = {
			lint = { unknownAtRules = "ignore" },
		},
	},

	html = {},
}

local function on_attach(_, bufnr)
	local telescope = require("telescope.builtin")
	local lspbuf = vim.lsp.buf

	vim.diagnostic.config({
		virtual_text = {
			prefix = "■ ",
		},
		float = { border = border },
	})

	local function nmap(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end
	nmap("<leader>rn", lspbuf.rename, "[R]e[n]ame")
	nmap("<leader>ca", lspbuf.code_action, "[C]ode [A]ction")

	nmap("gd", lspbuf.definition, "[G]oto [D]efinition")
	nmap("gr", telescope.lsp_references, "[G]oto [R]eferences")
	nmap("gI", lspbuf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", lspbuf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	nmap("K", lspbuf.hover, "Hover Documentation")
	nmap("<C-k>", lspbuf.signature_help, "Signature Documentation")

	nmap("gD", lspbuf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", lspbuf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", lspbuf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(lspbuf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		lspbuf.format()
	end, { desc = "Format current buffer with LSP" })
end

return {
	"williamboman/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
	},
	lazy = false,
	priority = 1000,
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					handlers = handlers,
					init_options = {
						provideFormatter = false,
					},
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
				})
			end,
		})
	end,
}
