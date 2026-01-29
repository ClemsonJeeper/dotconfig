return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  },
  build = "make tiktoken", -- Only on MacOS or Linux
  config = function()
    require("CopilotChat").setup({
      answer_header = "   COPILOT ",
      question_header = "   USER ",
      error_header = "   ERROR ",
    })

    vim.keymap.set("n", "<leader>cp", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
    vim.keymap.set("v", "<leader>ce", function()
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")
      chat.ask("Please clean up this email, and make sure that you wrap all lines at 78 columns.", { selection = select.visual() })
    end, { desc = "Clean up email with Copilot" })
  end,
}
