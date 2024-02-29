local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "tailwindcss", "svelte", "texlab", "jdtls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- pyright for python 
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

-- gopls
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- elixirls for elixir 
lspconfig.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'elixir', 'eelixir' },
  cmd = { 'elixir-ls' },
  message_level = vim.lsp.protocol.MessageType.error,
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
    },
  },
  root_dir = function(fname)
    return util.root_pattern('mix.exs', '.git')(fname) or util.path.dirname(fname)
  end,
  single_file_support = true,
}

-- texlab for latex 
lspconfig.texlab.setup {
  filetypes = { "tex" },
}
