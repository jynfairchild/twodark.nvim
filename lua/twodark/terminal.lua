local M = {}
local cfg = vim.g.twodark_config
local c = require 'twodark.colors'

function M.setup()
    if not cfg.term_colors then return end
    vim.g.terminal_color_0 = c.placeholder
    vim.g.terminal_color_1 = c.terminal_typing  -- typing
    vim.g.terminal_color_2 = c.terminal_keyword  -- keyword
    vim.g.terminal_color_3 = c.text_secondary
    vim.g.terminal_color_4 = c.terminal_directory  -- current directory
    vim.g.terminal_color_5 = c.terminal_carrot  -- > carrot
    vim.g.terminal_color_6 = c.terminal_directory  -- directories
    vim.g.terminal_color_7 = c.placeholder
    vim.g.terminal_color_8 = c.terminal_cursor  -- terminal cursor
    vim.g.terminal_color_9 = c.placeholder
    vim.g.terminal_color_10 = c.placeholder
    vim.g.terminal_color_11 = c.placeholder
    vim.g.terminal_color_12 = c.placeholder
    vim.g.terminal_color_13 = c.placeholder
    vim.g.terminal_color_14 = c.placeholder
    vim.g.terminal_color_15 = c.placeholder
end

return M
