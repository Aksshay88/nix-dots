local chatgpt_setup = {}

function chatgpt_setup.setup()
  require("chatgpt").setup({
    api_key_cmd = "secret-tool lookup api_key openai-api-key-here",
    yank_register = "+",
    show_line_numbers = true,
    chat = {
      welcome_message = [[
        If you don't ask the right questions,
        you don't get the right answers.
                                        ~ Robert Half
      ]],
      question_sign = "",
      answer_sign = "ﮧ",
      border_left_sign = "",
      border_right_sign = "",
      max_line_length = 120,
      keymaps = {
        close = "<C-c>",
        yank_last = "<C-y>",
        new_session = "<C-n>",
        next_message = "<C-j>",
        prev_message = "<C-k>",
        toggle_help = "<C-h>",
        stop_generating = "<C-x>",
      },
      sessions_window = {
        active_sign = "  ",
        inactive_sign = "  ",
        border = { style = "rounded", text = { top = " Sessions " } },
      },
    },
    popup_layout = {
      center = { width = "80%", height = "80%" },
    },
    popup_window = {
      border = { style = "rounded", text = { top = " ChatGPT " } },
      win_options = { wrap = true, linebreak = true },
    },
    openai_params = {
      model = "gpt-3.5-turbo",
      max_tokens = 300,
      temperature = 0,
    },
    openai_edit_params = {
      model = "gpt-3.5-turbo",
      temperature = 0,
    },
    show_quickfixes_cmd = "cope",
    predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
  })
end

return chatgpt_setup
--
-- local chatgpt_setup = {}
-- function chatgpt_setup.setup()
--   require("chatgpt").setup({
--     -- Fetch API key using op command (replace with your actual 1Password path)
--         api_key_cmd = "secret-tool lookup api_key openai-api-key-here",
--
--
--     yank_register = "+",
--     show_line_numbers = true,
--
--     -- Simple configuration without popup layout for now
--     chat = {
--       welcome_message = [[
--         If you don't ask the right questions,
--         you don't get the right answers.
--                                            ~ Robert Half
--       ]],
--       question_sign = "",
--       answer_sign = "ﮧ",
--       max_line_length = 120,
--       keymaps = {
--         close = "<C-c>",
--         yank_last = "<C-y>",
--         new_session = "<C-n>",
--         next_message = "<C-j>",
--         prev_message = "<C-k>",
--         stop_generating = "<C-x>",
--       },
--     },
--
--     -- Basic OpenAI parameters
--     openai_params = {
--       model = "gpt-3.5-turbo",
--       max_tokens = 300,
--       temperature = 0,
--     },
--   })
-- end
--
-- return chatgpt_setup
--
