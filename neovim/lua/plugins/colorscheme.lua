return {
  {
    "bavajitu/brellary.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("brellary")
    end,
  },
  {
    "oskarnurm/koda.nvim",
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = {},
        typeStyle = {},
        transparent = true,
        dimInactive = false,
        terminalColors = true,

        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
                bg = "none",
                bg_m3 = "none",
                bg_m2 = "none",
                bg_m1 = "none",
              },
            },
          },
        },

        overrides = function(colors)
          return {
            Normal = { bg = "none" },
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            SignColumn = { bg = "none" },
            LineNr = { bg = "none" },
            CursorLineNr = { bg = "none" },
            StatusLine = { bg = "none" },
            StatusLineNC = { bg = "none" },
            TabLine = { bg = "none" },
            TabLineFill = { bg = "none" },
            TabLineSel = { bg = "none" },
            WinSeparator = { bg = "none" },
            VertSplit = { bg = "none" },
            Pmenu = { bg = "none" },
            PmenuSel = { bg = "none" },
            TelescopeNormal = { bg = "none" },
            TelescopeBorder = { bg = "none" },
            NvimTreeNormal = { bg = "none" },
            NvimTreeNormalNC = { bg = "none" },
          }
        end,
      })

      -- vim.cmd("colorscheme kanagawa")
    end,
  },
}
