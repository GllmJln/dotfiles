local function map(lhs, rhs, mode, opts)
  local options = {noremap = true, silent = true}
  local modes = 'n'
  if opts then options = vim.tbl_extend('force', options, opts) end
  if mode then modes = mode end
  vim.api.nvim_set_keymap(modes, lhs, rhs, options)
end


-- Easymotion, move to word
-- map('<C-s>', '<Plug>(easymotion-bd-w)', '')
-- map('<C-s>', '<Plug>(easymotion-overwin-w)', 'n')

-- Terminal mappings to come

-- Resize splits

map('<M-o>', ':resize -2<CR>')
map('<M-i>', ':resize +2<CR>')
map('<M-p>', ':vertical resize -2<CR>')
map('<M-u>', ':vertical resize +2<CR>')

-- Yank
map('<S-y>', 'y$')

-- Drag lines
map('<M-j>', ':m\'>+<CR>gv', 'v')
map('<M-k>', ':m-2<CR>gv', 'v')
map('<M-j>', 'ddp')
map('<M-k>', 'ddkP')
map('<M-j>', '<esc>ddp', 'i')
map('<M-k>', '<esc>ddkP', 'i')

-- Buffer movement
map('<BS>', ':tabNext<CR>')

-- Splits navigations
map('<C-h>', '<C-w>h')
map('<C-j>', '<C-w>j')
map('<C-k>', '<C-w>k')
map('<C-l>', '<C-w>l')

-- Line movement
map('<S-h>', 'g^')
map('<S-l>', 'g$')
map('<S-h>', 'g^', 'v')
map('<S-l>', 'g$', 'v')
