local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'lua_ls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- Override mappings
local cmp_action = require('lsp-zero').cmp_action()

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    -- ['<CR>'] = cmp.mapping.confirm({select = false}),
    ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    -- ['<S-p>'] = cmp_action.luasnip_jump_forward(),
    -- ['<S-k>'] = cmp_action.luasnip_jump_backward(),

    -- ['<up>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<down>'] = cmp.mapping.select_next_item(cmp_select),
    -- ['<Tab>'] = nil,
    -- ['<S-Tab>'] = nil,

    -- ["<C-h>"] = cmp.mapping.scroll_docs(-4),
    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),


    ["<S-k>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<S-j>"] = cmp.mapping.select_next_item(cmp_select),

    ["<C-k>"] = cmp.mapping.scroll_docs(-4),
    ["<C-j>"] = cmp.mapping.scroll_docs(4),
    -- ["<C-e>"] = cmp.mapping.close(),
    -- ["<Esc>"] = cmp.mapping.close(),
    ["<S-l>"] = cmp.mapping.close(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = "luasnip"},
    {name = "buffer"},
  },

  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  window = {
    completion = {
      border = border("CmpBorder"),
      -- side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
      -- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
      scrollbar = true,
    },
    documentation = {
      border = border "CmpDocBorder",
      winhighlight = "Normal:CmpDoc",
    },
  },
})
