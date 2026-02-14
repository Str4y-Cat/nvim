-- Plugins with less that 10 lines of config
return {
	{
		-- Auto close paretheses, brackets, quotes, etc..
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = true,

			keywords = {
				MAGIC = { icon = " ", color = "magic" },
				REFACTOR = { icon = " ", color = "refactor" },
				PERF = { icon = "󰓅 " },
			},

			colors = {
				magic = { "#7C3AED" },
				refactor = { "#ff8b30" },
			},
		},
	},
	{ "NMAC427/guess-indent.nvim", opts = {} },
	{
		-- Colour highlighter, for working with colors, aka #ff0032
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
