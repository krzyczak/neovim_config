require('rose-pine').setup({
  -- disable_background = true,
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
-- ColorMyPencils("onedark")
-- ColorMyPencils("habamax")

function ToggleTransparentBackground()
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  if vim.g.previous_bg_color == nil then
    -- Save the current background color
    local current_bg_color = vim.api.nvim_get_hl_by_name("Normal", true).background
    vim.g.previous_bg_color = current_bg_color

    -- Set the background to transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  else
    -- Restore the previous background color
    vim.api.nvim_set_hl(0, "Normal", { bg = vim.g.previous_bg_color })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = vim.g.previous_bg_color })
    vim.g.previous_bg_color = nil
  end
end
