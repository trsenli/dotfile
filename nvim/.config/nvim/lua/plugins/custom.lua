return{
  {"ellisonleao/gruvbox.nvim"},
  {"rebelot/kanagawa.nvim"},
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      vim.g.autoformat = false -- globally
      require'lspconfig'.clangd.setup{}
      require'lspconfig'.lua_ls.setup{}
    end
  },
}
