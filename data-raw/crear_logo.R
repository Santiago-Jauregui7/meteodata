dir.create(
  "man/figures",
  recursive = TRUE,
  showWarnings = FALSE
)

svg_logo <- c(
  '<svg xmlns="http://www.w3.org/2000/svg" width="240" height="278" viewBox="0 0 240 278" role="img" aria-labelledby="titulo">',
  '<title id="titulo">Logo de meteodata</title>',
  '<polygon points="120,6 234,72 234,206 120,272 6,206 6,72" fill="#0f172a" stroke="#38bdf8" stroke-width="6" stroke-linejoin="round"/>',
  '<circle cx="162" cy="76" r="26" fill="#fbbf24"/>',
  '<path d="M72 126 H165 C179 126 188 117 188 104 C188 91 178 81 165 81 C161 63 146 52 130 55 C115 56 104 66 101 80 C86 76 72 85 70 98 C56 99 50 106 52 114 C54 121 61 126 72 126 Z" fill="#f8fafc"/>',
  '<polyline points="62,166 91,153 120,162 149,143 178,151" fill="none" stroke="#38bdf8" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>',
  '<g fill="#38bdf8"><circle cx="62" cy="166" r="4"/><circle cx="91" cy="153" r="4"/><circle cx="120" cy="162" r="4"/><circle cx="149" cy="143" r="4"/><circle cx="178" cy="151" r="4"/></g>',
  '<text x="120" y="216" fill="#f8fafc" font-family="Arial, sans-serif" font-size="30" font-weight="700" text-anchor="middle">meteodata</text>',
  '<text x="120" y="237" fill="#cbd5e1" font-family="Arial, sans-serif" font-size="10" letter-spacing="1" text-anchor="middle">DATOS DEL TIEMPO</text>',
  '</svg>'
)

writeLines(
  svg_logo,
  con = "man/figures/logo.svg",
  useBytes = TRUE
)
