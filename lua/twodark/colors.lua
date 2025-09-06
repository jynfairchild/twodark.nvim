local colors = require("twodark.palette")

local function select_colors()
    local selected = { none = "none" }
    -- Fallback to 'darker' to ensure robustness if style is invalid
    local palette = colors[vim.g.twodark_config.style] or colors.darker
    selected = vim.tbl_extend("force", selected, palette)
    selected = vim.tbl_extend("force", selected, vim.g.twodark_config.colors)
    return selected
end

return select_colors()
