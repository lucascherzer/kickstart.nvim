local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local mappings = {
  ['f'] = {
    name = "[F]ind with Telescope",
    ['f'] = {"<cmd>Telescope find_files<cr>", "Find Files"},
    ['b'] = {"<cmd>Telescope buffers<cr>", "Find Buffers"},
    ['g'] = {"<cmd>Telescope live_grep<cr>", "Live grep"},
    ['h'] = {"<cmd>Telescope help_tags<cr>", "Find Help"},
     -- Add more file key mappings here...
   }
}
local which_key_opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
  expr = false, -- use `expr` when creating keymaps
}
require('which-key').register(mappings, which_key_opts)


return {
  {
  'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
