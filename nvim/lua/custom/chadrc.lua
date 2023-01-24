
-- vim diagnostic config
vim.diagnostic.config {
  virtual_text = true,
}

local M = {}

-- Path to overriding theme and highlights files
-- local themes = require "custom.overidden_themes"
local highlights = require "custom.highlights"

M.ui = {
  theme_toggle = { "onedark", "one_light" },
  theme = "everforest",
  -- changed_themes = themes,
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.mappings = require "custom.mappings"

M.plugins = require "custom.plugins"

return M
