-- set colorscheme to catppuccin with protected call
-- in case it isn't installed
--local status, _ = pcall(vim.cmd, "colorscheme gruvbox") 
local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
-- local status, _ = pcall(function() vim.cmd("colorscheme catppuccin") end)
--local status, _ = pcall(vim.cmd, "colorscheme nordic")
-- vim.g.catppuccin_flavour = "mocha"
-- vim.g.catppuccin_transparent_background = true
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
