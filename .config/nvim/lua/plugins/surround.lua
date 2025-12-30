return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup()
  end,
}
-- Nutzung:
-- ys{motion}{char} - Surround hinzufügen (z.B. ysiw" für Wort in Quotes)
-- ds{char} - Surround löschen (z.B. ds" löscht Quotes)
-- cs{old}{new} - Surround ändern (z.B. cs"' ändert " zu ')
