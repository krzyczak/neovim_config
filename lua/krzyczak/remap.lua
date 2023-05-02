vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever - preserve register content on replace
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
-- vim.keymap.set("n", "<leader>/", function()
--   require("Comment.api").toggle.linewise.current()
-- end)

vim.keymap.set("n", "<leader>enc", "mzggg?G`z")

-- Set Terminal Mappings
vim.keymap.set("n", "<C-t>", function ()
  if vim.fn.bufexists("terminal") ~= 0 then
    local bufnr = vim.fn.bufnr("terminal")
    if vim.fn.bufwinnr(bufnr) == -1 then
      vim.cmd("botright vertical sbuffer " .. bufnr)
      vim.cmd("startinsert")
    end
  else
    vim.api.nvim_command("botright vsplit term://$SHELL")
  end
end, {})

vim.keymap.set("t", "<C-t>", "<cmd>:hide<CR>", {})
vim.api.nvim_command("autocmd TermOpen * file terminal") -- starts in insert mode
vim.api.nvim_command("autocmd TermOpen * startinsert") -- starts in insert mode
vim.api.nvim_command("autocmd TermOpen * setlocal norelativenumber") -- no numbers
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber") -- no numbers
vim.api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column

vim.keymap.set('n', '<C-right>', "<C-w>l")
vim.keymap.set('n', '<C-left>', "<C-w>h")
vim.keymap.set('t', '<C-right>', "<C-\\><C-n><C-w>l")
vim.keymap.set('t', '<C-left>', "<C-\\><C-n><C-w>h")
vim.keymap.set('t', '<esc>', "<C-\\><C-n>")
