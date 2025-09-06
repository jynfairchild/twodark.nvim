local M = {}
local cfg = vim.g.twodark_config
local c = require 'twodark.colors'

function M.setup()
    if not cfg.term_colors then return end
    -- If an iTerm palette is available, prefer it for 1:1 parity
    local ok, iterm = pcall(require, 'twodark.iterm')
    if ok and type(iterm) == 'table' and #iterm >= 16 then
        for i = 0, 15 do
            vim.g["terminal_color_" .. i] = iterm[i + 1]
        end
        return
    end

    -- Fallback: theme-aligned mapping
    -- Use a dark grey for ANSI black to avoid pure-black crush
    vim.g.terminal_color_0 = c.grey_5
    -- Core accents mapped to theme keywords
    vim.g.terminal_color_1 = c.keyword_func
    vim.g.terminal_color_2 = c.keyword
    vim.g.terminal_color_3 = c.number
    vim.g.terminal_color_4 = c.yellow
    vim.g.terminal_color_5 = c.purple
    vim.g.terminal_color_6 = c.cyan
    vim.g.terminal_color_7 = c.fg
    vim.g.terminal_color_8 = c.grey
    vim.g.terminal_color_9 = c.keyword_func
    vim.g.terminal_color_10 = c.keyword
    vim.g.terminal_color_11 = c.number
    vim.g.terminal_color_12 = c.yellow
    vim.g.terminal_color_13 = c.purple
    vim.g.terminal_color_14 = c.cyan
    vim.g.terminal_color_15 = c.fg
end

return M
