return {
  "michaeljsmith/vim-indent-object",
  event = "VeryLazy",
}
-- Nutzung:
-- ii - inner indent (gleiche Einrückung)
-- ai - around indent (inkl. Zeile darüber)
-- aI - around Indent (inkl. Zeilen darüber und darunter)
-- iI - inner Indent (alle gleich eingerückten Zeilen, strikt)
--
-- Kombinationen:
-- dii - delete inner indent
-- cii - change inner indent
-- yii - yank inner indent
-- vai - visual select around indent
