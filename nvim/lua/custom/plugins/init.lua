local overrides = require "custom.plugins.overrides"

return {
  -- copilot
  ["github/copilot.vim"] = {
    -- to accept suggestion using SHIFT-TAB
    -- event = "InsertEnter",
    -- config = function()
    --   require("copilot").setup {
    --     keymap = {
    --       accept = "<S-Tab>",
    --     },
    --   }
    -- end,
  },

  -- leap
  ["ggandor/leap.nvim"] = {
    -- add the default mappings for leap.nvim
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  -- tabout
  ["abecodes/tabout.nvim"] = {
    config = function()
      require("tabout").setup {
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      }
    end,
    wants = { "nvim-treesitter" }, -- or require if not used so far
    after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
  },

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
