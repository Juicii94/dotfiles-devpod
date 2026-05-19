-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         cds = {
--           cmd = { "cds-lsp", "--stdio" },
--           filetypes = { "cds" },
--           root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
--         },
--       },
--     },
--   },
-- }
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      cds_lsp = {
        cmd = {
          vim.fn.expand("cds-lsp"),
          "--stdio",
        },
        filetypes = { "cds" },
      },
    },
  },
}
