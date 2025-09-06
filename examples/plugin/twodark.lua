-- Base Twodark config example
-- Copy this file to your Neovim config at: ~/.config/nvim/plugin/twodark.lua

require('twodark').setup({
  style = 'darker',
  term_colors = true, -- set to false to keep your terminal palette
})

require('twodark').load()

