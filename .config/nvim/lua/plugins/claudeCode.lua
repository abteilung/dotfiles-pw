-- In deiner LazyVim Config (z.B. lua/plugins/claudecode.lua)
return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal = {
        split_side = "right", -- oder "left"
        split_width_percentage = 0.25,
        -- Hier kommt der wichtige Teil:
        snacks_win_opts = {
          wo = {
            winhighlight = "Normal:ClaudeNormal",
          },
        },
      },
    },
    config = function(_, opts)
      -- Definiere die Hintergrundfarbe
      vim.api.nvim_set_hl(0, "ClaudeNormal", {
        bg = "#24273a", -- Deine gewünschte Farbe
      })

      require("claudecode").setup(opts)
    end,
  },
}
