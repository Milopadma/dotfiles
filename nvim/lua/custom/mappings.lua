local M = {}
-- general mappings
M.general = {
  n = {
    ["<C-d>"] = {
      "<C-d>zz"
    };
    ["<C-u>"] = {
      "<C-d>zz"
    }
  }
}
-- lsp zero config
M.lspzero = {
  n = {
    -- for formattingg
    ["<leader>fm"] = { "<cmd> LspZeroFormat <CR>", "Format with lspzero" },

    -- lsp stuff
    ["F2"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "rename references",
    },

    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
  },
}

-- undotree stuff
M.undotree = {
  n = {
    -- toggle undotree
    ["<leader>tu"] = { "<cmd> UndotreeToggle <CR>", "Toggle undotree" },
  },
}

return M
