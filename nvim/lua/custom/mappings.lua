local M = {}

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

return M
