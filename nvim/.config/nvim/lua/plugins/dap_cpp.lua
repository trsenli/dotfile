return {

  "mfussenegger/nvim-dap",

  config = function()
    -- adapters 的名字可以随便取，但是configration中 type 要指定对应的 adaper
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })
    local dap = require("dap")
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        -- CHANGE THIS to your path!
        command = "~/.local/share/nvim/mason/packages/codelldb/codelldb",
        args = { "--port", "${port}" },

        -- On windows you may have to uncomment this:
        -- detached = false,
      },
    }

    -- configration 的名字要和语言对应，不能随便取
    dap.configurations.cpp = {
      {
        name = "cpplaunch",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    -- 复用配置
    dap.configurations.c = dap.configurations.cpp
  end,
}
