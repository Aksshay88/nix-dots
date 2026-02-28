local noice_setup = {}

function noice_setup.setup()
  require("noice").setup({
    cmdline = {
      enabled = true, -- Enable Noice cmdline UI
      view = "cmdline_popup", -- Use popup view for cmdline
      opts = {}, -- Global options for cmdline
    },
    views = {
      cmdline_popup = {
        position = {
          row = 5, -- Position at top (5% from top)
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
    lsp = {
      progress = { enabled = true },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = false, -- Use a classic bottom cmdline for search
      command_palette = true, -- Position the cmdline like a palette
      long_message_to_split = true, -- Long messages go into a split
      inc_rename = false, -- Disable inc_rename if not needed
      lsp_doc_border = true, -- Add a border to hover documentation
    },
  })
end

return noice_setup

