-- local builtin = require("telescope.builtin")
--
-- local actions = require("telescope.actions")
-- require("telescope").setup({
-- 	defaults = {
-- 		mappings = {
-- 			i = {
-- 				-- MAPPINGS
-- 			},
-- 		},
-- 		file_ignore_patterns = { "node_modules" },
-- 	},
-- 	pickers = {
-- 		find_files = {
-- 			hidden = true,
-- 		},
-- 	},
-- })
--


local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

-- Fix for ft_to_lang compatibility issue
if vim.treesitter.language and not vim.treesitter.language.get_filetypes then
	vim.treesitter.language.get_filetypes = function(lang)
		return { lang }
	end
end

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				-- MAPPINGS
			},
		},
		file_ignore_patterns = { "node_modules" },
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
			}),
		},
	},
})
require("telescope").load_extension("ui-select")
