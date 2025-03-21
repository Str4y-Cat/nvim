-- Standalone plugins with less than 10 lines of config
return {
  {
    -- Auto close paretheses, brackets, quotes, etc..
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {},
  },
  {
    -- Creates coloured todo comments.
    --FIX:
    --TODO:
    --HACK:
    --WARN:
    --PERF:
    --NOTE:
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true
    }

  },
  {
    -- Colour highlighter, for working with colors, aka #ff0032
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },



}
