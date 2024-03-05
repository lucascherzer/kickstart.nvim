

return {
    'f-person/git-blame.nvim',
    config = function()
        local git_blame = require('gitblame')
        git_blame.setup({
            date_format = '%r',
        })
        vim.g.gitblame_display_virtual_text = 0

        vim.keymap.set('n', '<leader>gof', vim.cmd.GitBlameOpenFileURL)
        vim.keymap.set('n', '<leader>goc', vim.cmd.GitBlameOpenCommitURL)

        local default_message_template = '<author> (<date>)'
        -- local descriptive_message_template = '<author> (<date>) <summary>'
        vim.g.gitblame_message_template = default_message_template
        vim.cmd.GitBlameEnable()
        -- TODO: figure out how to make this function globally accessible so
        -- it can be used in the <leader>gm command
        local function GitBlameMessageToggle()
            vim.cmd.GitBlameDisable()
            if vim.g.gitblame_message_template == default_message_template then
                vim.g.gitblame_message_template = descriptive_message_template
            else
                vim.g.gitblame_message_template = default_message_template
            end
            vim.cmd.GitBlameEnable()
        end

        local mappings = {
          ['g'] = {
            name = "[G]it",
            ['m'] = {"<cmd>toggleBlameMessage<cr>", "Find Help"},
            ['o'] = {
                    ['f'] = {"<cmd>GitBlameOpenFileURL<cr>", "Open [F]ile in Remote"},
                    ['c'] = {"<cmd>GitBlameOpenCommitURL<cr>", "Open [C]ommit in Remote"}
                }
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

        -- vim.keymap.set('n', '<leader>gm', toggleBlameMessage)
    end
}
