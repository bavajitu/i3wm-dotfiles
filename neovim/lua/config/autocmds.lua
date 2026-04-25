-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Fix conceallevel for json files:
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "c" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- disable automatic commenting on new line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({
      "c",
      "r",
      "o",
    })
  end,
})

-- enable auto clang compiler for C files
vim.opt.makeprg = "clang -Wall -Wextra -Wpedantic -g % -o %<"

-- Set default shell for neovim
vim.o.shell = "/usr/bin/zsh"

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = general,
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = general,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})
