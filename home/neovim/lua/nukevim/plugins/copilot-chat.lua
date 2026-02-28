local IS_DEV = false

local function get_git_diff(staged)
  local cmd = staged and "git diff --staged" or "git diff"
  local handle = io.popen(cmd)
  if not handle then return "" end
  local result = handle:read("*a")
  handle:close()
  return result
end

local prompts = {
  Explain = "Please explain how the following code works.",
  Review = "Please review the following code and provide suggestions for improvement.",
  Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Refactor = "Please refactor the following code to improve its clarity and readability.",
  FixCode = "Please fix the following code to make it work as intended.",
  FixError = "Please explain the error in the following text and provide a solution.",
  BetterNamings = "Please provide better names for the following variables and functions.",
  Documentation = "Please provide documentation for the following code.",
  SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
  SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
  Summarize = "Please summarize the following text.",
  Spelling = "Please correct any grammar and spelling errors in the following text.",
  Wording = "Please improve the grammar and wording of the following text.",
  Concise = "Please rewrite the following text to make it more concise.",
}

local M = {}

M.setup = function()
  require("packer").use {
    dir = IS_DEV and "~/Projects/research/CopilotChat.nvim" or nil,
    "CopilotC-Nvim/CopilotChat.nvim",
    version = "1.9.1",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      show_help = "no",
      prompts = prompts,
      debug = false,
      disable_extra_info = "no",
      hide_system_prompt = "yes",
      proxy = "",
    },
    build = function()
      vim.notify("Please update remote plugins by running ':UpdateRemotePlugins' and restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>ah", function() require("CopilotChat.code_actions").show_help_actions() end, desc = "Help Actions" },
      { "<leader>ap", function() require("CopilotChat.code_actions").show_prompt_actions() end, desc = "Prompt Actions" },
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Explain Code" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "Generate Tests" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "Review Code" },
      { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "Refactor Code" },
      { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "Better Naming" },
      { "<leader>av", ":CopilotChatVisual", mode = "x", desc = "Open in Vertical Split" },
      { "<leader>ax", ":CopilotChatInPlace<cr>", mode = "x", desc = "Run In-Place Code" },
      { "<leader>ai", function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then vim.cmd("CopilotChat " .. input) end
        end, desc = "Ask Copilot" },
      { "<leader>am", function()
          local diff = get_git_diff()
          if diff ~= "" then
            vim.fn.setreg('"', diff)
            vim.cmd("CopilotChat Write commit message for the change with commitizen convention.")
          end
        end, desc = "Commit Message (All Changes)" },
      { "<leader>aM", function()
          local diff = get_git_diff(true)
          if diff ~= "" then
            vim.fn.setreg('"', diff)
            vim.cmd("CopilotChat Write commit message for the change with commitizen convention.")
          end
        end, desc = "Commit Message (Staged Changes)" },
      { "<leader>aq", function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then vim.cmd("CopilotChatBuffer " .. input) end
        end, desc = "Quick Chat" },
      { "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "Debug Info" },
      { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Fix Diagnostic" },
      { "<leader>aF", "<cmd>CopilotChatFixError<cr>", desc = "Fix Error" },
      { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "Clear Chat History" },
      { "<leader>av", "<cmd>CopilotChatVsplitToggle<cr>", desc = "Toggle Vsplit" },
    },
  }
end

return M

