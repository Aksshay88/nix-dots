-- crates.lua
local status_ok, crates = pcall(require, "crates")
if not status_ok then
  return
end

crates.setup({
  -- You can add more configuration options here as needed
})

-- You can also set up additional keymaps here if you prefer
