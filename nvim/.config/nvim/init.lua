require('settings')
require('packer-config')
require('colorschemes-config.nightfox')
require('mappings')
require('lua-config.lang-servers')
require('lua-config.nvim-cmp')
require('lualine-config')

require("nvim-autopairs").setup {}
require("bufferline").setup{}
require('Comment').setup()
require('gitsigns').setup()
require("toggleterm").setup()
