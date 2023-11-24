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
  -- Disable Plugin Updates notifications
  {
    "folke/noice.nvim",
    opts = function (_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "Plugin Updates"
        },
        opts = { skip = true },
      })
    end,
  },
  -- UI animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_,opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  -- logo
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function (_,opts)
      local logo = [[
     ████████╗██████╗ ███████╗███████╗███╗   ██╗██╗     ██╗
     ╚══██╔══╝██╔══██╗██╔════╝██╔════╝████╗  ██║██║     ██║
        ██║   ██████╔╝███████╗█████╗  ██╔██╗ ██║██║     ██║
        ██║   ██╔══██╗╚════██║██╔══╝  ██║╚██╗██║██║     ██║
        ██║   ██║  ██║███████║███████╗██║ ╚████║███████╗██║
        ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝
      ]]
      logo = string.rep("\n",8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}


