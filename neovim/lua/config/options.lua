vim.opt.mouse = ""
-- Mouse (disabled)

-- Term GUI colors
vim.opt.termguicolors = true

-- Tabs and indentation
vim.opt.tabstop = 4 -- 4 spaces for tabs
vim.opt.shiftwidth = 4 -- Indentation width
vim.opt.expandtab = true -- Use spaces, not tabs
vim.opt.smartindent = true -- Auto-indent
vim.opt.autoindent = true

-- Line wrapping
vim.opt.wrap = false
vim.opt.linebreak = false

-- Performance
vim.opt.timeoutlen = 300 -- Faster key sequence timeout
vim.opt.ttimeoutlen = 50 -- Terminal key sequence timeout
vim.opt.updatetime = 250 -- Faster CursorHold events
vim.opt.redrawtime = 1500

-- LSP diagnostics
vim.cmd("highlight DiagnosticUnderlineError gui=undercurl guisp=#FF0000")
vim.cmd("highlight DiagnosticUnderlineWarn gui=undercurl guisp=#FFA500")
vim.cmd("highlight DiagnosticUnderlineInfo gui=undercurl guisp=#00FFFF")
vim.cmd("highlight DiagnosticUnderlineHint gui=undercurl guisp=#00FF00")

-- Line highlight
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

-- Native status line configuration:
-- LSP diagnostics (errors only → ✗)
-- function _G.stl_errors()
--   local e = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
--   return e > 0 and " ✗ " or ""
-- end
--
-- -- Git branch (requires git in PATH)
-- function _G.stl_branch()
--   -- check if inside a git repo
--   if vim.fn.isdirectory(".git") == 0 and vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null") == "" then
--     return ""
--   end
--
--   local b = vim.fn.systemlist("git branch --show-current")[1]
--   return (b and b ~= "") and (" [" .. b .. "] ") or ""
-- end
--
-- -- Mode (compact)
-- function _G.stl_mode()
--   return " " .. vim.fn.mode():upper() .. " "
-- end
--
-- -- Set the status line:
-- vim.o.statusline = table.concat({
--   " %f", -- file
--   " %m ", -- [+] modified
--   "%{v:lua.stl_branch()}", -- main
--   " %{v:lua.stl_errors()}", -- ✗ if errors
--   "%=", -- right align
--   "%p%%  ", -- 52%
--   "%{strftime('%H:%M')}  ", -- 15:30 (time)
--   "%{v:lua.stl_mode()}", -- mode
-- })

-- Setting up the polybar module:

local status_file = "/tmp/nvim_status"

local function update_status()
  local file = vim.fn.expand("%:p")
  if file == "" then
    file = ""
  end

  local git_branch =
    vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse --abbrev-ref HEAD 2>/dev/null"):gsub("\n", "")

  local repo = vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse --show-toplevel 2>/dev/null")

  if repo == nil or repo == "" or git_branch == "" then
    git_branch = ""
  end

  local content = file .. "\n" .. git_branch

  local f = io.open(status_file, "w")
  if f then
    f:write(content)
    f:close()
  end
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "BufWinEnter" }, {
  callback = update_status,
})
