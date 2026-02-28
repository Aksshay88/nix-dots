-- ~/.config/nvim/lua/nukevim/plugins/obsidian.lua
local obsidian_setup = {}
function obsidian_setup.setup()
  require("obsidian").setup({
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },
  })
end

return obsidian_setup

