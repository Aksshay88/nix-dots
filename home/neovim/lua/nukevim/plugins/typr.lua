local M = {}

M.setup = function()
    local typr = require("typr")

    vim.keymap.set("n", "<leader>ty", ":Typr<CR>", { silent = true, desc = "Open Typr"})
    vim.keymap.set("n", "<leader>ts", ":TyprStats<CR>", { silent = true, desc = "Show Typr Stats" })

    vim.keymap.set("n", "<leader>t1", function()
        typr.start(1)
    end, { desc = "Start Typr Mode 1" })

    vim.keymap.set("n", "<leader>t2", function()
        typr.start(2)
    end, { desc = "Start Typr Mode 2" })

    vim.keymap.set("n", "<leader>t3", function()
        typr.start(3)
    end, { desc = "Start Typr Mode 3" })

    vim.keymap.set("n", "<leader>t4", function()
        typr.start(4)
    end, { desc = "Start Typr Mode 4" })
end

return M

