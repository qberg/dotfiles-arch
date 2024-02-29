local elixir = require "elixir"
local elixirls = require("elixir.elixirls")

elixir.setup {
  nextls = {
    enable = true,
    port = 9000,
    cmd = "/home/qberg/.local/share/nvim/mason/bin/nextls",
    init_options = {
      mix_env = "dev",
      mix_target = "host",
      experimental = {
        completions = {
          enable = true,
        },
      },
    },
  },
  credo = {enable=true},
  elixirls = {
    enable = true,
    settings = elixirls.settings {
      dialyzerEnabled = false,
      enableTestLenses = false,
      suggestSpecs = true,
    },
    on_attach = function (client, bufnr)
      vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<CR>", { buffer=true, noremap=true })
      vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    end
  }
}
