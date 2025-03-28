return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
		{
			"williamboman/mason.nvim",
			config = true,
		},
	},
	config = function()
		local configs = require("lspconfig.configs")
		local utils = require("lspconfig.util")

		local servers = {
			ocamllsp = {},
			--./arduino-language-server \
			-- -clangd /usr/local/bin/clangd \
			-- -cli /usr/local/bin/arduino-cli \
			-- -cli-config $HOME/.arduino15/arduino-cli.yaml \
			-- -fqbn arduino:mbed:nanorp2040connect
			arduino_language_server = {
				capabilities = {
					symanticTokens = false,
				},
				cmd = {
					"arduino-language-server",
					"-clangd",
					"/Users/matthewanderson1/.local/share/nvim/mason/bin/clangd",
					"-cli",
					"/opt/homebrew/bin/arduino-cli",
					"-cli-config",
					"/Users/matthewanderson1/Library/Arduino15/arduino-cli.yaml",
					"-fqbn",
					"arduino:avr:uno",
				},
			},
			tmux_language_server = {},
			intelephense = {},
			luau_lsp = {
				cmd = {
					"luau-lsp",
					"lsp",
					"--definitions",
					vim.fn.resolve("/users/matthewanderson1/Repos/whg5/globalTypes.d.luau"),
				},
			},
		}

		configs.tmux_language_server = {
			default_config = {
				cmd = { "tmux-language-server", "--output-format", "json" },
				filetype = "tmux",
			},
		}

		for key, val in pairs(servers) do
			require("lspconfig")[key].setup(val)
		end
	end,
}
