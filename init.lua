-- The changed vim base options
require("core.options")

-- The base remapped keymaps
require("core.keymaps")

-- The base autocommands
require("core.autocommands")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({

	-- NOTE: Here is where you install your plugins.
	--
	-- global color theme

	-- Landing page
	require("plugins.alpha"),

	-- Syntax Highlighting
	require("plugins.treesitter"),

	-- Code Completion
	require("plugins.autocompletion"),

	-- Autoformatting
	require("plugins.autoformat"),

	-- Editor theme
	require("plugins.colorscheme"),

	-- Git change signs
	require("plugins.gitsigns"),

	-- Lines for indented code
	require("plugins.indent-blankline"),

	-- Lazygit git controller
	require("plugins.lazygit"),

	-- Linter
	require("plugins.lint"),

	-- Diagnstic line
	require("plugins.lualine"),

	-- Helpful general plugins
	require("plugins.mini"),

	-- miscelaneos, less than 10 lines of setup
	require("plugins.misc"),

	-- lsp configuration
	require("plugins.nvim-lspconfig"),

	-- file explorer
	require("plugins.oil"),

	-- Cursor smear
	-- require("plugins.smear"),

	-- fuzzy search
	require("plugins.telescope"),

	-- indent manager
	require("plugins.ufo"),

	-- helpful key guidance
	require("plugins.which-key"),

	-- adds context to php lsp for laravel projects
	require("plugins.laravel-ide-helper"),

	-- adds navigation to laravel projects
	require("plugins.blade-nav"),
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
