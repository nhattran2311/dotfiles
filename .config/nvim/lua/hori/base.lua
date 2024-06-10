vim.cmd("autocmd!")
local set = vim.opt
local o = vim.o
local wo = vim.wo
local bo = vim.bo

vim.scriptencoding = 'utf-8'
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

-- Basic setting
set.number = true
set.relativenumber = true
set.title = true
set.hlsearch = true
set.backup = false
set.showcmd = true
set.cmdheight = 1
set.laststatus = 2
set.showmatch = true -- show matching brackets
set.smartcase = true -- do smart case matching
set.ignorecase = true  -- do case insensitive matching
set.linebreak = true
set.wrap = true -- set no wrap lines
set.swapfile = false
-- Set indent
set.autoindent = true
set.smartindent = true
-- Set the behavior of tab
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

-- Set Theme
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.cmd[[colorscheme tokyonight-night]]
vim.o.background = 'dark'
vim.g.tokyonight_style = "night"


-- Set fold enable
set.foldenable = true
set.foldmethod = 'marker'
set.foldmarker = "{{{,}}}"

-- Show white space
set.list = true
set.listchars = {eol = '↲', tab = '▸ ', trail = '·'}

-- Copy to clipboard windows
set.clipboard:prepend { 'unnamed', 'unnamedplus' }

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterirks in block comments
set.formatoptions:append { 'r' }


