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
  end,
}
