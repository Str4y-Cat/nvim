return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"V13Axel/neotest-pest",
	},
	config = function()
		local neotest = require("neotest")

		neotest.setup({
			-- neotest-pest auto-detects Laravel Sail and runs tests through it.
			-- See sail_enabled/sail_executable/sail_project_path in its README
			-- if your docker-compose.yml doesn't match Sail's defaults.
			adapters = {
				require("neotest-pest"),
			},
		})

		vim.keymap.set("n", "<leader>nn", function()
			neotest.run.run()
		end, { desc = "[N]eotest [N]earest" })
		vim.keymap.set("n", "<leader>nf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "[N]eotest [F]ile" })
		vim.keymap.set("n", "<leader>nS", function()
			neotest.run.stop()
		end, { desc = "[N]eotest [S]top" })
		vim.keymap.set("n", "<leader>ns", function()
			neotest.summary.toggle()
		end, { desc = "[N]eotest [S]ummary" })
		vim.keymap.set("n", "<leader>no", function()
			neotest.output.open({ enter = true })
		end, { desc = "[N]eotest [O]utput" })
		vim.keymap.set("n", "<leader>nO", function()
			neotest.output_panel.toggle()
		end, { desc = "[N]eotest [O]utput Panel" })
	end,
}
