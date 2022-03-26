local wk = require('which-key')

local leader = ' '

local keymap = {
  w = {':w<CR>', 'save file'},
  q = {':wqa<CR>', 'quit'},
  r = {':source $MYVIMRC<CR>', 'reload config'},
  [" "] = "which_key_ignore"







}


wk.register(keymap, {prefix = leader})
