return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  --build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        --accept = "<C-y>",
        accept = "<tab>",
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = {
      enabled = true,
      auto_refresh = true,
    },
    filetypes = {
      markdown = true,
      help = true,
      mail = true,
      lua = false,
    },
  },
}
