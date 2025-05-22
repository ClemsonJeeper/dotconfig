return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup({})

    dap.set_log_level("DEBUG")

    vim.g.is_dapui_open = false

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
      vim.opt.mouse = "nvi"
      vim.g.is_dapui_open = true
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
      vim.opt.mouse = "nvi"
      vim.g.is_dapui_open = true
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
      vim.opt.mouse = ""
      vim.g.is_dapui_open = false
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
      vim.opt.mouse = ""
      vim.g.is_dapui_open = false
    end

    -- gdb adapter for C
    dap.adapters.gdb = {
      type = "executable",
      command = "/homes/rjohnst/bin/jdebug_wrapper.sh",
      --command = "/volume/jaas-scratch/syrajendra/jdebug-src/jdebug/jdebug/jdebug.py",
      -- args = { "--no_prints", }
      --command = "/volume/hab/Linux/Ubuntu-20.04/x86_64/gdb/15.2/current/bin/gdb",
      --args = { "--interpreter=dap", }
      -- args = { "--debugger_arg='--interpreter=dap'", }
      --"--eval-command", "set print pretty on" }
    }

    dap.configurations.c = {
      {
        name = "Launch local debugger",
        type = "gdb",
        request = "launch",
        program = function()
          local path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          dap.adapters.gdb.args = { path, }
          return path
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = "Attach to remote gdbserver/deebee",
        type = "gdb",
        request = "attach",
        --target = "10.49.21.222:5900",
        target = function()
          local default = vim.g.gdb_remote and vim.g.gdb_remote or "ip address:port"
          vim.g.gdb_remote = vim.g.gdb_remote or ""
          remote = vim.fn.input("Remote target [" .. default .. "]: ", vim.g.gdb_remote)
          vim.g.gdb_remote = remote
          return remote
        end,
        program = function()
          local path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          dap.adapters.gdb.args = { path, }
          return path
        end,
        cwd = "${workspaceFolder}"
      },
      {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
          local path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          dap.adapters.gdb.args = { path, }
          return path
        end,
        pid = function()
          local name = vim.fn.input("Executable name (filter): ")
          return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = "${workspaceFolder}"
      },
    }

    -- configuration and keymaps
    vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })

    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Start/continue debugging" })

    vim.keymap.set("n", "<Leader>dd", function()
      dapui.toggle()
      if vim.g.is_dapui_open == false then
        vim.opt.mouse = "nvi"
        vim.g.is_dapui_open = true
      else
        vim.opt.mouse = ""
        vim.g.is_dapui_open = false
      end
    end, { desc = "Toggle debugging UI" })
  end,
}
