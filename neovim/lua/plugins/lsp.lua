return {
  {
    "mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "css-lsp",
        "clangd",
        "rust-analyzer",
        "marksman",
        "impl",
        "codelldb",
        "eslint-lsp",
        "prettierd",
        "emmet-ls",
        "html-lsp",
        "texlab",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buf = args.buf
          vim.lsp.inlay_hint.enable(false)
          local map = vim.keymap.set
          local opts = { buffer = buf, silent = true }

          map("n", "gd", vim.lsp.buf.definition, opts)
          map("n", "gD", vim.lsp.buf.declaration, opts)
          map("n", "gr", vim.lsp.buf.references, opts)
          map("n", "gi", vim.lsp.buf.implementation, opts)
          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "<leader>rn", vim.lsp.buf.rename, opts)
          map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          map("n", "[d", vim.diagnostic.goto_prev, opts)
          map("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      vim.diagnostic.config({
        virtual_text = {
          spacing = 2,
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      -- If using nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- C / C++
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = {
          "clangd",

          "--background-index",
          "--clang-tidy",
          "--compile-commands-dir=build",

          "--completion-style=detailed",
          "--header-insertion=iwyu",
          "--suggest-missing-includes",
          "--all-scopes-completion",
          "--function-arg-placeholders",

          "--cross-file-rename",
          "--pch-storage=memory",
        },
        init_options = {
          clangdFileStatus = true,
        },
      })

      -- Rust
      vim.g.rustaceanvim = {
        server = {
          capabilities = capabilities,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              checkOnSave = true,
              check = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
              },
              diagnostics = {
                enable = true,
                experimental = {
                  enable = true,
                },
              },
              inlayHints = {
                bindingModeHints = { enable = false },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true, minLines = 25 },
                closureReturnTypeHints = { enable = "with_block" },
                lifetimeElisionHints = { enable = "skip_trivial" },
                parameterHints = { enable = true },
                reborrowHints = { enable = "mutable" },
                typeHints = {
                  enable = true,
                  hideClosureInitialization = false,
                  hideNamedConstructor = false,
                },
              },
              completion = {
                callable = {
                  snippets = "fill_arguments",
                },
                postfix = {
                  enable = true,
                },
              },
              hover = {
                actions = {
                  enable = true,
                },
              },
              lens = {
                enable = true,
                implementations = { enable = true },
                references = { enable = true },
                run = { enable = true },
                debug = { enable = true },
              },
              assist = {
                importGranularity = "module",
                importPrefix = "by_self",
              },
              files = {
                excludeDirs = { "target", "node_modules" },
              },
            },
          },
        },
      }

      -- LaTeX
      lspconfig.texlab.setup({
        capabilities = capabilities,
        settings = {
          texlab = {
            build = {
              executable = "latexmk",
              args = {
                "-pdf",
                "-interaction=nonstopmode",
                "-synctex=1",
                "%f",
              },
              onSave = true,
            },
            forwardSearch = {
              executable = "zathura",
              args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
          },
        },
      })
    end,
  },
}
