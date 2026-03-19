# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A personal Neovim configuration based on kickstart.nvim, structured for web development (PHP/Laravel, Vue, TypeScript, Liquid/Shopify, GLSL).

## Architecture

```
init.lua                  ← Entry point: loads core modules, then bootstraps lazy.nvim and all plugins
lua/core/
  options.lua             ← vim options (tabs=2 spaces, relativenumber, clipboard=unnamedplus, etc.)
  keymaps.lua             ← leader key (<Space>), global keymaps, diagnostic config
  autocommands.lua        ← yank highlight autocommand
lua/plugins/              ← Each file returns a lazy.nvim plugin spec table
  nvim-lspconfig.lua      ← LSP + mason (auto-install) + blink.cmp capabilities
  autoformat.lua          ← conform.nvim: format-on-save + <leader>f
  lint.lua                ← nvim-lint: eslint_d triggers on BufWrite/InsertLeave + <leader>l
  treesitter.lua          ← uses new `branch = "main"` rewrite of nvim-treesitter
  telescope.lua           ← fuzzy finder with LSP-aware keymaps set on LspAttach
  oil.lua                 ← file explorer (<leader>o), hidden files shown by default
  mini.lua                ← mini.ai, mini.surround, mini.comment (gc/gcc)
  which-key.lua           ← key hint popup
  ... (colorscheme, gitsigns, lualine, lazygit, alpha, ufo, etc.)
.reference/               ← Old/alternative configs for reference only — NOT loaded
.kickstart_reference/     ← Upstream kickstart.nvim snapshot — NOT loaded
```

## Plugin Management

In Neovim:
- `:Lazy` — open lazy.nvim UI (install/update/clean plugins)
- `:Mason` — manage LSP servers and tools (press `g?` for help in the UI)
- `:ConformInfo` — show active formatters for current buffer
- `:TSUpdate` — update treesitter parsers

## Key LSP / Tooling Notes

**Installed LSP servers** (via mason-tool-installer): `phpactor`, `vue-language-server`, `typescript-language-server` (with `@vue/typescript-plugin` injected for Vue support), `html-lsp`, `css-lsp`, `bash-language-server`, `emmet-ls`, `shopify-cli`, `glsl_analyzer`, `lua_ls` (configured separately for Neovim runtime).

**mason-tool-installer workaround**: `nvim-lspconfig.lua` maintains a `duplicate_ensure_installed` list (strings) alongside the `servers` table (used for lsp config). This is intentional — `mason-tool-installer` needs Mason package names (hyphenated), while `vim.lsp.config()` uses lspconfig server names. Don't collapse these into one list.

**Formatters** (conform.nvim):
- Lua → `stylua`
- JS/TS/CSS/HTML/Vue/Liquid/JSON/YAML/Markdown → `prettierd` (fallback: `prettier`)
- PHP → `pint` (fallback: `php`)
- Blade → `blade-formatter`
- Bash → `shfmt`
- C/C++ → format-on-save disabled

**Linters** (nvim-lint): `eslint_d` for JS/TS/JSX/TSX/Svelte/Vue; `markdownlint` for Markdown.

## Important Keymaps

Leader key is `<Space>`.

| Key | Action |
|-----|--------|
| `<leader>f` | Format buffer (conform.nvim) |
| `<leader>l` | Trigger linting |
| `<leader>o` | Open Oil file explorer |
| `<leader>sf` | Search files (Telescope) |
| `<leader>sg` | Live grep (Telescope) |
| `<leader>sn` | Search Neovim config files |
| `<leader>q` | Open diagnostic quickfix list |
| `<leader>th` | Toggle inlay hints (when LSP supports it) |
| `grn` | LSP rename |
| `gra` | LSP code action |
| `grd` | Go to definition |
| `grr` | Go to references |
| `gri` | Go to implementation |
| `grD` | Go to declaration |
| `grt` | Go to type definition |
| `gO` / `gW` | Document / workspace symbols |
| `gc` / `gcc` | Toggle comment (visual / line) |

## Adding a New Plugin

Create a new file in `lua/plugins/` returning a lazy.nvim spec table, then `require()` it in `init.lua` inside the `require("lazy").setup({...})` call. For trivial plugins (< ~10 lines of config), add to `lua/plugins/misc.lua` instead.

## Nerd Font

`vim.g.have_nerd_font = false` in `options.lua`. Set to `true` if a Nerd Font is active in the terminal — this enables icons in which-key and other places.
