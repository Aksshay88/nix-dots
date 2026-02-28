-- Markdown Render Configuration
local M = {}

function M.setup()
    require('render-markdown').setup({
        theme = "dark",          -- Use dark theme
        auto_start = true,       -- Automatically render Markdown on open
    })
end

M.setup()

return M

