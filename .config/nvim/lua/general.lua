local set = vim.opt

vim.g.mapleader = ' '

set.autoread = true
set.hidden = true
set.linebreak = true
set.breakindent = true
set.mouse = 'a'
set.ruler = true
set.expandtab = true
set.tabstop = 2
set.shiftwidth = 2
set.smarttab = false
set.splitbelow = true
set.splitright = true
set.syntax = 'on'
set.termguicolors = true

set.encoding = 'UTF-8'




set.pumheight = 10
set.showmode = false
set.number = true
set.relativenumber = true
-- set.background = 'dark'
set.indentexpr = ''
set.indentkeys = ''
set.laststatus = 0
set.showtabline = 2
set.cursorline = true

set.ignorecase = true
set.smartcase = true

set.updatetime = 300
set.timeoutlen = 300



set.conceallevel = 0
set.scrolloff = 5
set.clipboard = 'unnamedplus'


vim.cmd [[

autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_gb
set nocindent
set t_Co=256

filetype plugin indent on
au! BufWritePost $MYVIMRC source %



]]
