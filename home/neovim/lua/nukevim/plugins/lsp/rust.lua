local float_term = require("nukevim.core.term").float_term

vim.keymap.set("n", "<leader>cc", function()
  float_term("cargo clippy")
end, { desc = "🧹 Clippy" })

vim.keymap.set("n", "<leader>cb", function()
  float_term("cargo build")
end, { desc = "🔨 Build" })

vim.keymap.set("n", "<leader>cr", function()
  float_term("cargo run")
end, { desc = "🚀 Run" })

vim.keymap.set("n", "<leader>ct", function()
  float_term("cargo test")
end, { desc = "🧪 Test" })

vim.keymap.set("n", "<leader>cd", function()
  float_term("cargo doc --open")
end, { desc = "📘 Docs" })
