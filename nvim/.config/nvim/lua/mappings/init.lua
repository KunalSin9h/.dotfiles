local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- bufferline
map('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
map('n', '>b', ':BufferLineMoveNext<CR>', opts)
map('n', '<b', ':BufferLineMovePrev<CR>', opts)

-- better terminal
map('i', '<Esc>', '<C-\\><C-n>', opts) -- Terminal normal mode
map('i', 'jj', '<C-\\><C-n>', opts) -- Terminal normal mode

map('i', '<C-h>', '<c-\\><c-n><c-w>h', opts) -- Terminal left window navigation
map('n', '<C-h>', '<c-\\><c-n><c-w>h', opts) -- Terminal left window navigation

map('i', '<C-j>', '<c-\\><c-n><c-w>j', opts) -- Terminal down window navigation
map('n', '<C-j>', '<c-\\><c-n><c-w>j', opts) -- Terminal down window navigation

map('i', '<C-k>', '<c-\\><c-n><c-w>k', opts) -- Terminal up window navigation
map('n', '<C-k>', '<c-\\><c-n><c-w>k', opts) -- Terminal up window navigation

map('i', '<C-l>', '<c-\\><c-n><c-w>l', opts) -- Terminal right window navigation
map('n', '<C-l>', '<c-\\><c-n><c-w>l', opts) -- Terminal right window navigation

-- Neotree
map('n', '<Space>e', '<cmd>Neotree toggle<CR>', opts) -- Toggle Explorer
map('n', '<Space>o', '<cmd>Neotree focus<cr>', opts) -- Focus Explorer

-- toggleterm
map('n', '<Space>tf', '<cmd>ToggleTerm direction=float<cr>', opts) -- Toggle Terminal Float
map('n', '<Space>th', '<cmd>ToggleTerm  size=15 direction=horizontal<cr>', opts) -- Toggle Horizontal
map('n', '<Space>tv', '<cmd>ToggleTerm  size=80  direction=vertical<cr>', opts) -- Toggle Horizontal

-- telescope
map('n', '<Space>ff', '<cmd>Telescope find_files<cr>', opts) 
map('n', '<Space>fg', '<cmd>Telescope live_grep<cr>', opts) 
map('n', '<Space>fb', '<cmd>Telescope buffers<cr>', opts) 
map('n', '<Space>fh', '<cmd>Telescope help_tags<cr>', opts) 
