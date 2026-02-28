require("claude-code").setup({
	window = {
		position = "float",
		enter_insert = true,
		hide_numbers = true,
		hide_signcolumn = true,
		float = {
			width = "50%",
			height = "50%",
			row = "center",
			col = "center",
			relative = "editor",
			border = "double",
		},
	},
	refresh = {
		enable = true,
		updatetime = 100,
		timer_interval = 1000,
		show_notifications = true,
	},
	git = {
		use_git_root = true,
	},
	shell = {
		separator = "&&",
		pushd_cmd = "pushd",
		popd_cmd = "popd",
	},
	command = "claude",
	command_variants = {
		continue = "--continue",
		resume = "--resume",
		verbose = "--verbose",
	},
	keymaps = {
		toggle = {
			normal = "<C-,>",
			terminal = "<C-,>",
			variants = {
				continue = "<leader>cC",
				verbose = "<leader>cV",
			},
		},
		window_navigation = true,
		scrolling = true,
	},
})

vim.keymap.set("n", "<leader>CC", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
