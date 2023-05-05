require('gitsigns').setup({
  on_attach = function (bufnr)
    vim.keymap.set("n", "<leader>gb", function ()
      package.loaded.gitsigns.blame_line({full=false})
    end);
  end
})
