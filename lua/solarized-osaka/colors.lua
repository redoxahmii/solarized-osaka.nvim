local util = require("solarized-osaka.util")
local hslutil = require("solarized-osaka.hsl")
local hsl = hslutil.hslToHex

local M = {}

---@class Palette
M.default = {
  none = "NONE",

  base04 = hsl(192, 100, 5),
  base03 = hsl(192, 100, 11),
  base02 = hsl(192, 81, 14),
  base01 = hsl(194, 14, 40),
  base00 = hsl(196, 13, 45),
  -- base0 = hsl( 186, 8, 55 ),
  base0 = hsl(186, 8, 65),
  -- base1 = hsl( 180, 7, 60 ),
  base1 = hsl(180, 7, 70),
  base2 = hsl(46, 42, 88),
  base3 = hsl(44, 87, 94),
  base4 = hsl(0, 0, 100),
  yellow = hsl(45, 100, 35),
  yellow100 = hsl(47, 100, 80),
  yellow300 = hsl(45, 100, 50),
  yellow500 = hsl(45, 100, 35),
  yellow700 = hsl(45, 100, 20),
  yellow900 = hsl(46, 100, 10),
  orange = hsl(18, 80, 44),
  orange100 = hsl(17, 100, 70),
  orange300 = hsl(17, 94, 51),
  orange500 = hsl(18, 80, 44),
  orange700 = hsl(18, 81, 35),
  orange900 = hsl(18, 80, 20),
  red = hsl(1, 71, 52),
  red100 = hsl(1, 100, 80),
  red300 = hsl(1, 90, 64),
  red500 = hsl(1, 71, 52),
  red700 = hsl(1, 71, 42),
  red900 = hsl(1, 71, 20),
  magenta = hsl(331, 64, 52),
  magenta100 = hsl(331, 100, 73),
  magenta300 = hsl(331, 86, 64),
  magenta500 = hsl(331, 64, 52),
  magenta700 = hsl(331, 64, 42),
  magenta900 = hsl(331, 65, 20),
  violet = hsl(237, 43, 60),
  violet100 = hsl(236, 100, 90),
  violet300 = hsl(237, 69, 77),
  violet500 = hsl(237, 43, 60),
  violet700 = hsl(237, 43, 50),
  violet900 = hsl(237, 42, 25),
  blue = hsl(205, 69, 49),
  blue100 = hsl(205, 100, 83),
  blue300 = hsl(205, 90, 62),
  blue500 = hsl(205, 69, 49),
  blue700 = hsl(205, 70, 35),
  blue900 = hsl(205, 69, 20),
  cyan = hsl(175, 59, 40),
  cyan100 = hsl(176, 100, 86),
  cyan300 = hsl(175, 85, 55),
  cyan500 = hsl(175, 59, 40),
  cyan700 = hsl(182, 59, 25),
  cyan900 = hsl(183, 58, 15),
  green = hsl(68, 100, 30),
  green100 = hsl(90, 100, 84),
  green300 = hsl(76, 100, 49),
  green500 = hsl(68, 100, 30),
  green700 = hsl(68, 100, 20),
  green900 = hsl(68, 100, 10),

  bg = hsl(192, 100, 5),
  bg_highlight = hsl(192, 100, 11),
  fg = hsl(186, 8, 55),
}

---@class Palette
M.light = {
  -- Inverted base colors
  base04 = M.default.base4,
  base03 = M.default.base3,
  base02 = M.default.base2,
  base01 = M.default.base1,
  base00 = M.default.base0,
  base0 = M.default.base00,
  base1 = M.default.base01,
  base2 = M.default.base02,
  base3 = M.default.base03,
  base4 = M.default.base04,

  -- Inverted accent colors
  yellow = M.default.yellow,
  yellow100 = M.default.yellow900,
  yellow300 = M.default.yellow700,
  yellow500 = M.default.yellow500,
  yellow700 = M.default.yellow300,
  yellow900 = M.default.yellow100,

  orange = M.default.orange,
  orange100 = M.default.orange900,
  orange300 = M.default.orange700,
  orange500 = M.default.orange500,
  orange700 = M.default.orange300,
  orange900 = M.default.orange100,

  red = M.default.red,
  red100 = M.default.red900,
  red300 = M.default.red700,
  red500 = M.default.red500,
  red700 = M.default.red300,
  red900 = M.default.red100,

  magenta = M.default.magenta,
  magenta100 = M.default.magenta900,
  magenta300 = M.default.magenta700,
  magenta500 = M.default.magenta500,
  magenta700 = M.default.magenta300,
  magenta900 = M.default.magenta100,

  violet = M.default.violet,
  violet100 = M.default.violet900,
  violet300 = M.default.violet700,
  violet500 = M.default.violet500,
  violet700 = M.default.violet300,
  violet900 = M.default.violet100,

  blue = M.default.blue,
  blue100 = M.default.blue900,
  blue300 = M.default.blue700,
  blue500 = M.default.blue500,
  blue700 = M.default.blue300,
  blue900 = M.default.blue100,

  cyan = M.default.cyan,
  cyan100 = M.default.cyan900,
  cyan300 = M.default.cyan700,
  cyan500 = M.default.cyan500,
  cyan700 = M.default.cyan300,
  cyan900 = M.default.cyan100,

  green = M.default.green,
  green100 = M.default.green900,
  green300 = M.default.green700,
  green500 = M.default.green500,
  green700 = M.default.green300,
  green900 = M.default.green100,

  bg = M.default.base3,
  bg_highlight = M.default.base2,
  fg = M.default.base01,
}

---@return ColorScheme
function M.setup(opts)
  opts = opts or {}
  local config = require("solarized-osaka.config")

  local style = config.is_light() and config.options.light_style or config.options.style
  local palette = M[style] or {}
  if type(palette) == "function" then
    palette = palette()
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = vim.tbl_deep_extend("force", vim.deepcopy(M.default), palette)

  util.bg = colors.bg
  util.day_brightness = config.options.day_brightness

  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.base04
  colors.bg_statusline = colors.base03

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
    or config.options.styles.sidebars == "dark" and colors.base04
    or colors.bg

  colors.bg_float = config.options.styles.floats == "transparent" and colors.none
    or config.options.styles.floats == "dark" and colors.base04
    or colors.bg

  -- colors.fg_float = config.options.styles.floats == "dark" and colors.base01 or colors.fg
  colors.fg_float = colors.fg

  colors.error = colors.red500
  colors.warning = colors.yellow500
  colors.info = colors.blue500
  colors.hint = colors.cyan500
  colors.todo = colors.violet500

  config.options.on_colors(colors)

  return colors
end

return M
