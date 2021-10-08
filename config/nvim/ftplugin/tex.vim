lua << EOF

  -- WHICH-KEY BINDINGS
  local wk = require('which-key')
  local leader = ' '
  
  local keymap = {
  b = {':VimtexCompile<CR>', 'build'},
  c = {':VimtexCountWords<CR>', 'count'},
  p = {':VimtexView<CR>', 'preview'},
  l = {':VimtexErrors<CR>', 'error log'},
  L = {
  name = '+LaTeX',
  t = {':VimtexTocOpen<CR>', 'toc'},
  c = {':VimtexClean<CR>', 'rm junk files'},
  e = {':terminal bibexport -o %:p:r.bib %:p:r.aux<CR>', 'bib export'}
    }
    }

  wk.register(keymap, { prefix = leader })
EOF

" Custom autopairs, mostly for $ in equations
let g:AutoPairs = {
      \ "`":"'",
      \ "(":")",
      \ "[":"]",
      \ "{":"}",
      \ "$":"$",
      \ "( ": " )",
      \ "[ ": " ]",
      \ "{ ": " }",
      \ "$ ": " $",
      \ }

