return{
  {"ellisonleao/gruvbox.nvim"},
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      vim.g.autoformat = false -- globally
    end
  }
}
