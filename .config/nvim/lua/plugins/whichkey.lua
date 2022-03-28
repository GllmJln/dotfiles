local wk = require('which-key')

local leader = ' '

local keymap = {
  w = {':w<CR>', 'save file'},
  q = {':wqa<CR>', 'quit'},
  r = {':source $MYVIMRC<CR>', 'reload config'},
  [" "] = "which_key_ignore",
  f = {
  name = "find",
  s = {"<cmd>Telescope live_grep<cr>","String in files (live grep)"},
  f = {"<cmd>Telescope find_files<cr>","File"}
  },
  e = {'<cmd>:NvimTreeToggle<cr>',"Toggle file explorer"}
  








}


wk.register(keymap, {prefix = leader})
