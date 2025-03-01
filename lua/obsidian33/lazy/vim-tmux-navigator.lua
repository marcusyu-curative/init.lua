return {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
        keys = {
            { "<C-w>h", "<cmd>TmuxNavigateLeft<cr>", mode = "n", silent = true },
            { "<C-w><C-h>", "<cmd>TmuxNavigateLeft<cr>", mode = "n", silent = true },
            { "<C-w>j", "<cmd>TmuxNavigateDown<cr>", mode = "n", silent = true },
            { "<C-w><C-j>", "<cmd>TmuxNavigateDown<cr>", mode = "n", silent = true },
            { "<C-w>k", "<cmd>TmuxNavigateUp<cr>", mode = "n", silent = true },
            { "<C-w><C-k>", "<cmd>TmuxNavigateUp<cr>", mode = "n", silent = true },
            { "<C-w>l", "<cmd>TmuxNavigateRight<cr>", mode = "n", silent = true },
            { "<C-w><C-l>", "<cmd>TmuxNavigateRight<cr>", mode = "n", silent = true },
        },
        init = function()
            vim.g.tmux_navigator_no_wrap = 1
            vim.g.tmux_navigator_no_mappings = 1
        end,
    }
}
