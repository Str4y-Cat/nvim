require 'core.options'
require 'core.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- global colortheme
  require 'plugins.colortheme',

  -- filetree
  require 'plugins.neotree',

  -- bottom status line
  require 'plugins.lualine',

  -- Syntax highlighting
  require 'plugins.treesitter',

  -- Fuzzyfinder
  require 'plugins.telescope',

  -- Language Server
  require 'plugins.lsp',

  -- Code Completion
  require 'plugins.autocompletion',

  -- Code Formatting
  require 'plugins.autoformatting',

  -- Git Intergration
  require 'plugins.gitsigns',

  -- Cool Intro page
  require 'plugins.alpha',

  -- Indent lines
  require 'plugins.indent-blankline',

  -- Small Helper functions
  require 'plugins.mini',

  -- Key hints
  require 'plugins.which-key',

  -- Method folding
  require 'plugins.ufo',

  -- Directory viewer and editor
  require 'plugins.oil',

  -- Miscelaneous, less than 10 lines of config
  require 'plugins.misc',


})
