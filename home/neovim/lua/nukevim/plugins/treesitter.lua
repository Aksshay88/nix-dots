-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure installation preferences
local install_status, install = pcall(require, "nvim-treesitter.install")
if install_status then
	install.prefer_git = false
	install.compilers = { "clang" }
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"typescript",
		"css",
		"lua",
		"vim",
		"c",
		"cpp",
		"java",
		"javascript",
		"python",
		"html",
		"markdown",
		"markdown_inline",
	},
	-- auto install above language parsers
	auto_install = true,
})
