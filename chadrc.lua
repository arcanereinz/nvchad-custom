---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'onedark',
  hl_override = {
    Normal = {
      -- make background darker: https://nvchad.com/docs/config/theming
      bg = {"black", -10}
    },
  }
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
