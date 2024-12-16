return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local transparent = true
    local bg = "#011628"
    local bg_dark = "#011423"
    local bg_highlight = "#143652"
    local bg_search = "#0A64AC"
    local bg_visual = "#275378"
    local fg = "#CBE0F0"
    local fg_dark = "#B4D0E9"
    local fg_gutter = "#627E97"
    local border = "#547998"
    require("tokyonight").setup({
      style = "night",
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
      on_colors = function(colors)
        ---@class colors.bg = bg
        ---@class colors.bg_dark = transparent and colors.none or bg_dark
        ---@class colors.bg_float = transparent and colors.none or bg_dark
        ---@class colors.bg_highlight = bg_highlight
        ---@class colors.bg_popup = bg_dark
        ---@class colors.bg_search = bg_search
        ---@class colors.bg_sidebar = transparent and colors.none or bg_dark
        ---@class colors.bg_statusline = transparent and colors.none or bg_dark
        ---@class colors.bg_visual = bg_visual
        ---@class colors.border = border
        ---@class colors.fg = fg
        ---@class colors.fg_dark = fg_dark
        ---@class colors.fg_float = fg
        ---@class colors.fg_gutter = fg_gutter
        ---@class colors.fg_sidebar = fg_dark
      end,
    })
    vim.cmd("colorscheme tokyonight")
  end,
}
