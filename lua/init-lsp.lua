require("lsp-zero").setup({})
local lsp_config = require("lspconfig")

lsp_config.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          "vim",
          "require"
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

lsp_config.gopls.setup({})
lsp_config.rust_analyzer.setup({})
lsp_config.terraformls.setup({})
lsp_config.pylsp.setup({})
lsp_config.bashls.setup({})
