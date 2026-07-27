return {
	"mfussenegger/nvim-dap",
	-- Set to true to turn on debugging (PHP/Xdebug via Laravel Sail).
	-- NOTE: Sail's PHP image needs Xdebug configured before this is useful:
	--   xdebug.mode=debug and a client host that reaches the host machine.
	--   See https://laravel.com/docs/sail#debugging-with-xdebug
	enabled = false,
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			ensure_installed = { "php" },
			automatic_installation = true,
			handlers = {},
		})

		dapui.setup()

		-- Sail runs the app in a container at /var/www/html; map that back
		-- to the project root on the host. Adjust if your docker-compose.yml
		-- mounts the app somewhere else.
		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug (Sail)",
				port = 9003,
				pathMappings = {
					["/var/www/html"] = "${workspaceFolder}",
				},
			},
		}

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebug Toggle [B]reakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue / Start" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebug Step [I]nto" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[D]ebug Step [O]ver" })
		vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "[D]ebug Step [O]ut" })
		vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "[D]ebug [T]erminate" })
		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "[D]ebug Toggle [U]I" })
	end,
}
