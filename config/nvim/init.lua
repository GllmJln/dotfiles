require('plugins')
require('completion/cmp')
require('completion/lsp-install')
require('general')
require('bindings')
require('plugins/startify')
require('plugins/whichkey')
require('plugins/vimtex')
require('plugins/autopairs')
require('plugins/telescope')
require('plugins/colorizer')


vim.cmd[[
source ~/.config/nvim/themes/onedark.vim
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also https://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif
]]
vim.api.nvim_command([[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi normal guibg=NONE ctermbg=NONE
    augroup END
]])
