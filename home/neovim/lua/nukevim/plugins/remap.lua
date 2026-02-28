vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Move selected line / block of text in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--Move paste special register
vim.keymap.set("x", "<leader>p", '"_dP')


--yank to system clipboard and move towards the terminal and other stuffs

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
-- Delete without yanking
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")


-- search pattern in the regex pattern where I can just  search for the word and replace it
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- insert an error check 

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)
--source the current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

