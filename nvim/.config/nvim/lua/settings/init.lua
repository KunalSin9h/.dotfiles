local set = vim.opt

vim.notify = require("notify")

set.expandtab  = true
set.smarttab   = true
set.shiftwidth = 2
set.tabstop    = 2

set.hlsearch   = true
set.incsearch  = true
set.ignorecase = true
set.smartcase  = true  -- Case sensitivie searching

set.splitbelow = true -- Splitting a new window below the current one
set.splitright = true -- Splitting a new window at the right of the current one

set.wrap       = false
set.scrolloff  = 8

set.fileencoding  = 'utf-8' -- File content encoding for the buffer
set.termguicolors = true -- Enable 24-bit RGB color in the TUI

set.relativenumber = true
set.cursorline     = true
set.hidden         = true

set.clipboard = "unnamedplus"  -- Connection to the system clipboard
set.copyindent = true -- Copy the previous indentation on autoindenting
set.laststatus = 3 -- globalstatus
set.lazyredraw = true -- lazily redraw screen
set.mouse = "a" -- Enable mouse support
set.preserveindent = true -- Preserve indent structure as much as possible
set.pumheight = 10 -- Height of the pop up menu
set.showmode = false -- Disable showing modes in command line
set.sidescrolloff = 8 -- Number of columns to keep at the sides of the cursor
set.signcolumn = "yes" -- Always show the sign column

set.swapfile = false -- Disable use of swapfile for the buffer
timeoutlen = 300 -- Length of time to wait for a mapped sequence
undofile = true -- Enable persistent undo
updatetime = 300 -- Length of time to wait before triggering the plugin
writebackup = false -- Disable making a backup before overwriting a file

