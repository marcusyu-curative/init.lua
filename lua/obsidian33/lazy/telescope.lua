return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },

        config = function()
            require("telescope").setup({})

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<C-g>", builtin.git_files, { desc = "Telescope fuzzy find files" })
            vim.keymap.set("n", "<leader>pws", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end, { desc = "Telescope find files by word under cursor" })
            vim.keymap.set("n", "<leader>pWs", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end, { desc = "Telescope find files by WORD under cursor" })
            --vim.keymap.set("n", "<leader>ps", function()
            --    builtin.grep_string({ search = vim.fn.input("Grep > ") })
            --end, { desc = "Telescope grep find files" })
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope grep find files" })
            vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Telescope help tags picker" })
        end
    }
}
