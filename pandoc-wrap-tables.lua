-- Fix README.md's GFM tables for PDF output: pandoc's LaTeX writer renders
-- plain pipe tables as non-wrapping l/c/r columns, which overflow the page
-- when a cell holds a long sentence or an unbreakable inline-code span.
-- Forcing explicit, equal column widths (colspecs, summing to just under
-- the full text width -- 0.94, not 1.0, to leave room for longtable's own
-- \tabcolsep padding on every column) switches the writer to wrapping
-- p{width} columns instead. README.md itself stays plain GFM (no width
-- attributes, no table markup changes) so GitHub's own rendering is
-- unaffected -- this only applies in this PDF conversion pass.
-- Adapted from vdcmaniac's pandoc-scale-images.lua (same root cause,
-- verified fix); UBoot64's tables hold no images, so only the Table pass
-- is needed here.
local function fix_table(tbl)
  local n = #tbl.colspecs
  for _, spec in ipairs(tbl.colspecs) do
    spec[2] = 0.94 / n
  end
  return tbl
end

return {
  { Table = fix_table },
}
