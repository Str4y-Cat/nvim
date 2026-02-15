return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},

	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		--formatters and linters for mason to install
		require("mason-null-ls").setup({
			ensure_installed = {
				"prettierd", -- js and typescript
				"stylua", -- lua
				"eslint_d", -- ts/js linter
				"shfmt", --shell
			},
			automatic_installation = true,
		})

		local sources = {
			-- diagnostics.eslint_d,
			formatting.prettierd.with({
				filetypes = { "js", "css", "scss", "vue", "html", "json", "yaml", "markdown" },
			}),
			formatting.stylua,
			formatting.shfmt.with({ args = { "-i", "4" } }),
		}

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({

			sources = sources,
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
