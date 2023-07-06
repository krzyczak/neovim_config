require('rose-pine').setup({
  disable_background = true,
})

require("catppuccin").setup({
    -- flavour = "mocha", -- latte, frappe, macchiato, mocha
    flavour = "macchiato",
    -- background = { -- :h background
    --     light = "latte",
    --     dark = "mocha",
    -- },
    -- transparent_background = false,
    transparent_background = true,
})

function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- ColorMyPencils("onelight")
-- ColorMyPencils()
ColorMyPencils("catppuccin")
-- ColorMyPencils("habamax")

