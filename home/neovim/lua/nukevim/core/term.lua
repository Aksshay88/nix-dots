-- local M = {}
--
-- M.float_term = function(cmd)
--   local buf = vim.api.nvim_create_buf(false, true)
--   local width = math.floor(vim.o.columns * 0.8)
--   local height = math.floor(vim.o.lines * 0.8)
--   local row = math.floor((vim.o.lines - height) / 2)
--   local col = math.floor((vim.o.columns - width) / 2)
--
--   vim.api.nvim_open_win(buf, true, {
--     relative = 'editor',
--     width = width,
--     height = height,
--     row = row,
--     col = col,
--     border = 'rounded',
--   })
--
--   vim.fn.termopen(cmd)
--   vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
--   vim.cmd("startinsert")
-- end
--
-- return M
--


local M = {}

-- Function to find the nearest Cargo.toml upwards from current directory
local function find_cargo_root()
  local path = vim.fn.expand('%:p:h')
  while path and path ~= "/" do
    if vim.fn.filereadable(path .. "/Cargo.toml") == 1 then
      return path
    end
    path = vim.fn.fnamemodify(path, ":h")
  end
  return nil
end

-- Floating terminal with automatic cargo root detection
M.float_term = function(cmd)
  local cargo_root = find_cargo_root()
  if not cargo_root then
    vim.notify("No Cargo.toml found", vim.log.levels.ERROR)
    return
  end

  -- Create the buffer for the terminal
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Open the floating window
  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    border = 'rounded',
  })

  -- Set the working directory to the cargo root before running the command
  vim.cmd("lcd " .. cargo_root)
  -- Start the terminal with the command
  vim.fn.termopen(cmd)
  -- Set keymap to close the terminal window
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  vim.cmd("startinsert")
end

return M

