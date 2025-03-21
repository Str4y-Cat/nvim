-- LINES
vim.wo.number = true -- Make line numbers default
vim.o.relativenumber = true -- set relative line numbers
vim.o.wrap = true -- Display lines as one long line
vim.o.linebreak = true -- Companion to wrap, don't split words
vim.o.autoindent=true -- Copy the indent from current line when starting a new one

-- SEARCHING
vim.o.ignorecase = true -- Case insensitive searching UNLESS \C or capital is present
vim.o.smartcase = true -- Smart case?

--Setting tabstops
vim.o.expandtab=true -- convert tabs to spaces
vim.o.tabstop=2 -- insert n spaces for a tab
vim.o.softtabstop=2 -- 
vim.o.shiftwidth=2 -- the number of spaces inserted for each indentation

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
--vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

