return {
  "goolord/alpha-nvim",
  -- dependencies = { 'echasnovski/mini.icons' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    --dashboard.file_icons.provider = "devicons"

    dashboard.section.header.val = {

      [[                                               ]],
      [[   ██████ ▄▄▄█████▓ ██▀███   ▄▄▄     ▓██   ██▓ ]],
      [[ ▒██    ▒ ▓  ██▒ ▓▒▓██ ▒ ██▒▒████▄    ▒██  ██▒ ]],
      [[ ░ ▓██▄   ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██  ▀█▄   ▒██ ██░ ]],
      [[   ▒   ██▒░ ▓██▓ ░ ▒██▀▀█▄  ░██▄▄▄▄██  ░ ▐██▓░ ]],
      [[ ▒██████▒▒  ▒██▒ ░ ░██▓ ▒██▒ ▓█   ▓██▒ ░ ██▒▓░ ]],
      [[ ▒ ▒▓▒ ▒ ░  ▒ ░░   ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░  ██▒▒▒  ]],
      [[ ░ ░▒  ░ ░    ░      ░▒ ░ ▒░  ▒   ▒▒ ░▓██ ░▒░  ]],
      [[ ░  ░  ░    ░        ░░   ░   ░   ▒   ▒ ▒ ░░   ]],
      [[       ░              ░           ░  ░░ ░      ]],
      [[                                      ░ ░      ]],
      [[                                               ]],
    }

    alpha.setup(dashboard.opts)
    alpha.setup(dashboard.config)
  end,
}
