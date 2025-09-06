Twodark.nvim

- A focused, single-variant fork of onedark.nvim with a new semantic color system and careful plugin mappings. Current style: darker.

Installation (Lazy)

```lua
{
  'jynfairchild/twodark.nvim',
  priority = 1000, -- load before other UI plugins
  config = function()
    require('twodark').setup({
      style = 'darker',
      term_colors = true,
    })
    require('twodark').load()
  end,
}
```

Installation (Packer)

```lua
use {
  'jynfairchild/twodark.nvim',
  config = function()
    require('twodark').setup({
      -- style is fixed to 'darker' in this fork
      style = 'darker',
      -- enable terminal ANSI colors (uses twodark.itermcolors if present)
      term_colors = true,
      lualine = { transparent = false },
      -- override example:
      -- colors = { },
      -- highlights = { },
    })
    require('twodark').load()
  end
}
```

Quick Usage

- Lua: `require('twodark').load()`
- Vimscript: `colorscheme twodark`
- Lualine: `require('lualine').setup({ options = { theme = 'twodark' } })`

Terminal Colors

- By default, Twodark applies terminal ANSI colors. If a `twodark.itermcolors` file is included with the plugin, those 16 colors are used verbatim inside Neovim’s terminal; otherwise a theme-aligned fallback is applied.
- To disable terminal overrides: `require('twodark').setup({ term_colors = false })`.

Example plugin/twodark.lua (base config)

```lua
-- Put this file at: ~/.config/nvim/plugin/twodark.lua
require('twodark').setup({
  style = 'darker',
  term_colors = true,
})
require('twodark').load()
```

Notes

- This fork consolidates styles to a single palette and introduces semantic keys to make surgical color changes safer.
- Many plugin integrations are customized to match the alpha reference used during development.
