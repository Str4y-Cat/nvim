return {
	"cdmill/neomodern.nvim",
	commit = "3e13d7b",
	lazy = false,
	priority = 1000,
	config = function()
		require("neomodern").setup({
			-- optional configuration here
		})
		require("neomodern").load()
	end,
}
