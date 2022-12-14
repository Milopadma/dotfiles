local overrides = require "custom.plugins.overrides"

return {
  -- copilot
  ["github/copilot.vim"] = {},

  -- undotree
  ["mbbill/undotree"] = {},

  -- lsp-zero
  ["VonHeikemen/lsp-zero.nvim"] = {
    after = "nvim-lspconfig",
    requires = "williamboman/mason-lspconfig.nvim",
    config = function()
      require "custom.plugins.lsp-zero"
    end,
  },

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- vim-surround
  ["tpope/vim-surround"] = {
    event = "BufRead",
  },

  -- null-ls for lsp based formatting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
}
