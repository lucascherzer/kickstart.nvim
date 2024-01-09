-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      lazy = true,
      opts = {} -- this is equalent to setup({}) function
  },
  {
    "ggandor/leap.nvim",
    enabled = true,
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
	leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
	add = "gza", -- Add surrounding in Normal and Visual modes
	delete = "gzd", -- Delete surrounding
	find = "gzf", -- Find surrounding (to the right)
	find_left = "gzF", -- Find surrounding (to the left)
	highlight = "gzh", -- Highlight surrounding
	replace = "gzr", -- Replace surrounding
	update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },
}
