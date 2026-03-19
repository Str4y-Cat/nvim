-- return { -- Highlight, edit, and navigate code
-- 	"nvim-treesitter/nvim-treesitter",
-- 	branch = "main", -- New rewritten branch
-- 	build = ":TSUpdate",
-- 	config = function()
-- 		require("nvim-treesitter").setup({
-- 			ensure_installed = {
-- 				"blade",
-- 				"php_only",
-- 				"php",
-- 				"bash",
-- 				"c",
-- 				"diff",
-- 				"html",
-- 				"lua",
-- 				"luadoc",
-- 				"markdown",
-- 				"markdown_inline",
-- 				"query",
-- 				"vim",
-- 				"vimdoc",
-- 				"javascript",
-- 				"typescript",
-- 				"css",
-- 				"scss",
-- 				"liquid",
-- 				"vue",
-- 			},
-- 			-- Autoinstall languages that are not installed
-- 			auto_install = true,
-- 		})
--
-- 		vim.api.nvim_create_autocmd("FileType", {
-- 			callback = function()
-- 				pcall(vim.treesitter.start)
-- 			end,
-- 		})
-- 	end,
-- }

return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "master",
	config = function()
		require("nvim-treesitter.configs").setup({

			ensure_installed = {
				"bash",
				"vue",
				"scss",
				"css",
				"javascript",
				"typescript",
				"php",
				"liquid",
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
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
		})
	end,
}
