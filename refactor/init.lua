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
	-- global color theme
	require("plugins.alpha"),
	require("plugins.autocompletion"),
	require("plugins.autoformat"),
	require("plugins.colorscheme"),
	require("plugins.gitsigns"),
	require("plugins.indent-blankline"),
	require("plugins.lazygit"),
	require("plugins.lint"),
	require("plugins.lualine"),
	require("plugins.mini"),
	require("plugins.misc"),
	require("plugins.nvim-lspconfig"),
	require("plugins.oil"),
	-- require("plugins.smear"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.ufo"),
	require("plugins.which-key"),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
