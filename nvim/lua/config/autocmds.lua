-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    require("nvim-treesitter.parsers").cds = {
      install_info = {
        url = "https://github.com/cap-js-community/tree-sitter-cds.git",
        revision = "4b5240121f12036d6de87e02999b1389ec28674d",
        queries = "queries", -- also install queries from given directory
      },
      filetype = "cds",
      -- additional filetypes that use this parser
      used_by = { "cdl", "hdbcds" },
    }
  end,
})
