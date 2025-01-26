vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- TODO: This would be nice, but it interferes with LSP. Which keybindings instead?
-- vim.keymap.set("n", "K", ":m '<-2<CR>") -- conflicts with LSP
-- vim.keymap.set("v", "J", ":m '>+1<CR>") -- conflicts with line join below

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


vim.keymap.set("n", "<C-T>", ":tabnew<CR>")
vim.keymap.set("n", "<C-[>", ":tabprev<CR>")
vim.keymap.set("n", "<C-]>", ":tabnext<CR>")
vim.keymap.set("n", "<C-Q>", ":tabclose<CR>")

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<ESC>", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- Make it into a plugin which will react to ciw, ct[ etc.
-- Also should wrap in any type of wrapper, i.e. (), [], {}, "", etc...
-- Also it should possibly toggle?
vim.keymap.set("n", "<leader>q", "ciw\"\"<ESC>P")

-- vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
-- vim.keymap.set("n", "<leader>/", function()
--   require("Comment.api").toggle.linewise.current()
-- end)

vim.keymap.set("n", "<leader>enc", "mzggg?G`z")

-- Set Terminal Mappings - Commented out, because of tmux does this - TODO: remove all of this
-- vim.keymap.set("n", "<C-t>", function ()
--   if vim.fn.bufexists("terminal") ~= 0 then
--     local bufnr = vim.fn.bufnr("terminal")
--     if vim.fn.bufwinnr(bufnr) == -1 then
--       vim.cmd("botright vertical sbuffer " .. bufnr)
--       vim.cmd("startinsert")
--     end
--   else
--     vim.api.nvim_command("botright vsplit term://$SHELL")
--   end
-- end, {})
--
-- vim.keymap.set("t", "<C-t>", "<cmd>:hide<CR>", {})
-- vim.api.nvim_command("autocmd TermOpen * file terminal") -- starts in insert mode
-- vim.api.nvim_command("autocmd TermOpen * startinsert") -- starts in insert mode
-- vim.api.nvim_command("autocmd TermOpen * setlocal norelativenumber") -- no numbers
-- vim.api.nvim_command("autocmd TermOpen * setlocal nonumber") -- no numbers
-- vim.api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column
--
-- vim.keymap.set('n', '<C-right>', "<C-w>l")
-- vim.keymap.set('n', '<C-left>', "<C-w>h")
-- vim.keymap.set('t', '<C-right>', "<C-\\><C-n><C-w>l")
-- vim.keymap.set('t', '<C-left>', "<C-\\><C-n><C-w>h")
-- vim.keymap.set('t', '<esc>', "<C-\\><C-n>")

function swap_brackets(key)
  local bracket_pairs = {
    ['('] = ')', [')'] = '(', ['{'] = '}', ['}'] = '{', ['['] = ']', [']'] = '[', ['<'] = '>', ['>'] = '<'
  }

  local lpos = vim.fn.getpos('.')
  vim.cmd('normal! %')

  -- local rpos = vim.fn.getpos('.')
  vim.cmd('normal! r' .. bracket_pairs[key])

  vim.fn.setpos('.', lpos)
  vim.cmd('normal! r' .. key)
end

-- Keybindings
vim.keymap.set('n', '<leader>sw(', '<cmd>lua swap_brackets("(")<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sw{', '<cmd>lua swap_brackets("{")<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sw[', '<cmd>lua swap_brackets("[")<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sw<', '<cmd>lua swap_brackets("<")<cr>', { noremap = true, silent = true })

-- vim.keymap.set('i', '(', "()<left>");
-- vim.keymap.set('i', '[', "[]<left>");
-- vim.keymap.set('i', '{', "{}<left>");
-- vim.keymap.set('i', '<', "<><left>");
-- vim.keymap.set('i', '"', '""<left>');
-- vim.keymap.set('i', "'", "''<left>");

vim.keymap.set('v', "(", "c()<left><esc>p");
vim.keymap.set('v', "[", "c[]<left><esc>p");
vim.keymap.set('v', "{", "c{}<left><esc>p");
vim.keymap.set('v', "<", "c<><left><esc>p");
vim.keymap.set('v', "'", "c''<left><esc>p");
vim.keymap.set('v', '"', 'c""<left><esc>p');
