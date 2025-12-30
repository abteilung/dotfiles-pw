return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- CSS Language Server
        cssls = {
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
        -- Für Svelte (da du Svelte 5 verwendest)
        svelte = {
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
      },
    },
  },
}
