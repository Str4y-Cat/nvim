return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	branch = "main", -- New rewritten branch
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"blade",
			"php_only",
			"php",
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"javascript",
			"css",
			"scss",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
			--  If you are experiencing weird indenting issues, add the language to
			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
	},

	config = function()
		local ts = require("nvim-treesitter")
		local parsers = {
			"lua",
			"vim",
			"vimdoc",
			"bash",
			"markdown",
			"javascript",
			"php",
			"html",
			"css",
			"blade",
			"liquid",
			"typescript",
			"vue",
		}

		for _, parser in ipairs(parsers) do
			pcall(ts.install, parser)
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
