local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local tmux = require("harpoon.tmux")
local term = require("harpoon.term")

harpoon.setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})

local telescope_status_ok, telescope = pcall(require, "telescope")
if telescope_status_ok then
  telescope.load_extension("harpoon")
end
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
	ui.nav_file(4)
end)

vim.keymap.set("n", "<leader>tt", function() tmux.gotoTerminal(1) end, { desc = "Go to Tmux Terminal 1" })
vim.keymap.set("n", "<leader>tc", function() tmux.sendCommand(1, "ls -La") end, { desc = "Send ls -La to Tmux" })
vim.keymap.set("n", "<leader>ts", function() term.sendCommand(1, "ls -La") end, { desc = "Send ls -La to Term" })
