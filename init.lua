require("core")

function setWorkingDirectory()
  vim.cmd([[
  augroup ProjectRoot
  autocmd!
  autocmd BufEnter * silent! lcd %:p:h
  augroup END
  ]])
end

setWorkingDirectory()
