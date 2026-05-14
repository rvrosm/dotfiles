return {
{
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>fd', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>rg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

        -- file navigation
        vim.keymap.set("n", "<leader>f~", function() builtin.find_files({ cwd = "~" }) end)
        vim.keymap.set("n", "<leader>fc", function() builtin.find_files({ cwd = "~/.config" }) end)
        vim.keymap.set("n", "<leader>fz", function() builtin.find_files({ cwd = "~/.config/zsh" }) end)
        vim.keymap.set("n", "<leader>fv", function() builtin.find_files({ cwd = "~/.config/nvim" }) end)
        vim.keymap.set("n", "<leader>fp", function() builtin.find_files({ cwd = vim.fn.stdpath("config") .. "/lua/plugins" }) end, { desc = "Find plugin files" })
	end,

}
}
