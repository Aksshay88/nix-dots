-- leetcode.nvim configuration

local M = {}

M.setup = function()
  require("leetcode").setup({
    -- The argument for Neovim's leetcode.nvim plugin
    arg = "leetcode.nvim",

    -- Language for the Leetcode session (e.g., cpp, python3)
    lang = "cpp",

    -- Settings for leetcode.cn (Chinese LeetCode site)
    cn = {
      enabled = false,      -- Enable use of leetcode.cn
      translator = true,    -- Enable translation
      translate_problems = true, -- Translate problems to the selected language
    },

    -- Storage settings for leetcode data (home and cache directories)
    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode",  -- Leetcode data directory
      cache = vim.fn.stdpath("cache") .. "/leetcode", -- Cache directory
    },

    -- Plugins settings
    plugins = {
      non_standalone = false,  -- If the plugin is used as a standalone tool
    },

    -- Logging settings for debugging and status messages
    logging = true,

    -- Code injection settings
    injector = {
      -- Example: Inject default imports for different languages
      ["python3"] = { before = true },
      ["cpp"] = { before = { "#include <bits/stdc++.h>", "using namespace std;" }, after = "int main() {}" },
      ["java"] = { before = "import java.util.*;" },
    },

    -- Cache update interval in seconds (7 days in this example)
    cache = {
      update_interval = 60 * 60 * 24 * 7,  -- Update cache every 7 days
    },

    -- Console configuration
    console = {
      open_on_runcode = true,  -- Open console automatically when running code
      dir = "row",  -- Console layout direction
      size = { width = "90%", height = "75%" }, -- Console size (width and height)
      result = { size = "60%" },  -- Result section size
      testcase = { virt_text = true, size = "40%" },  -- Testcase section size
    },

    -- Question description configuration
    description = {
      position = "left",  -- Position of the description panel
      width = "40%",      -- Width of the description panel
      show_stats = true,  -- Show stats in the description panel
    },

    -- Picker configuration (Fuzzy finding provider)
    picker = {
      provider = nil,  -- Set to nil to use fzf-lua first, fallback to telescope if not found
    },

    -- Hooks for different events (on entering a question, etc.)
    hooks = {
      ["enter"] = {},  -- Hook when entering Leetcode menu
      ["question_enter"] = {},  -- Hook when entering a question
      ["leave"] = {},  -- Hook when leaving the Leetcode menu or question
    },

    -- Key mappings for various actions
    keys = {
      toggle = { "q" },  -- Key to toggle the Leetcode menu
      confirm = { "<CR>" },  -- Key to confirm selection
      reset_testcases = "r",  -- Key to reset the test cases
      use_testcase = "U",  -- Key to use the selected test case
      focus_testcases = "H",  -- Key to focus on the testcases section
      focus_result = "L",  -- Key to focus on the result section
    },

    -- Theme configuration for custom highlights
    theme = {},

    -- Whether to support rendering images in question descriptions
    image_support = false,
  })
end

return M

