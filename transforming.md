# Transforming Onedark → Twodark: Summary and Progress

## Summary of Your Goal
- Fork of the original `onedark.nvim`, renamed to “Twodark”.
- Maintain a separate `twodarkalpha.nvim` as a playground/reference while we convert the real plugin.
- Torch Onedark in the main plugin: rename modules, imports, globals, and colorscheme name to `twodark`.
- After it loads as a Neovim colorscheme, iterate carefully on the palette and highlights to create a new look.

## What We Did So Far
- Scanned and mapped the repository to identify Onedark references and the alpha area.
- Promoted `twodark` as the canonical theme in the root plugin by renaming and updating code:
  - Entry point: `colors/onedark.lua` → `colors/twodark.lua` and load `require('twodark')`.
  - Core module move: `lua/onedark/*` → `lua/twodark/*` with internal updates:
    - `require('onedark.*')` → `require('twodark.*')`.
    - `vim.g.onedark_config` → `vim.g.twodark_config`.
    - `vim.g.colors_name = "onedark"` → `"twodark"`.
    - `:colorscheme onedark` → `:colorscheme twodark`.
    - Error/notify titles updated to `twodark.nvim`.
  - Theme integrations renamed and updated:
    - `lua/lualine/themes/onedark.lua` → `lua/lualine/themes/twodark.lua`.
    - `lua/barbecue/theme/onedark.lua` → `lua/barbecue/theme/twodark.lua`.
- Palette/Colors/Utils:
  - Added `lua/twodark/palette.lua` (starting from original palette as a baseline to ensure execution).
  - Updated `lua/twodark/colors.lua` to use the `twodark` palette and config.
  - Ported `lua/twodark/util.lua` and fixed a small format bug in `blend()` while copying.
  - Ported `lua/twodark/highlights.lua` and `lua/twodark/terminal.lua` with config/import updates.
- Cleanup:
  - Removed old `lua/onedark/palette.lua` and `lua/onedark/util.lua`. The `lua/onedark` folder is now empty and unused.
  - Only README files still reference “onedark”; code paths are fully switched to `twodark`.
  - Left `twodarkalpha.nvim` untouched as a reference; it is not auto‑loaded.

## Current State
- `:colorscheme twodark` is the entry point and should load the theme.
- `require('twodark').setup({...}); require('twodark').load()` works for Lua configs.
- Lualine theme key is `twodark`; barbecue theme targets `twodark` as well.

## How to Test
- Ensure this repo is on your `runtimepath`, then:
  - Vimscript: `colorscheme twodark`
  - Lua: `require('twodark').setup({}); require('twodark').load()`
- Optional: In lualine: `require('lualine').setup({ options = { theme = 'twodark' } })`.

## Next Steps
- Update READMEs to reflect `twodark` usage and name.
- Begin iterative, careful tuning of `lua/twodark/palette.lua` and the mappings in `lua/twodark/highlights.lua`.
- Use `twodarkalpha.nvim` as a reference for ideas that already work, porting changes gradually.
