-- nukevim/plugins/nvim-notify.lua

-- Import nvim-notify and set it as the default notification manager
vim.notify = require("notify")

-- Optional configuration for nvim-notify
require("notify").setup({
    background_colour = "#1e1e2e", -- Set background color (optional)
    stages = "slide",              -- Animation style (fade, slide, etc.)
    timeout = 3000,                -- Notification display duration (in ms)
    top_down = true,              -- Notifications appear from bottom to top
})

