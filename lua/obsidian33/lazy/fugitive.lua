return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

            local obsidian33_fugitive = vim.api.nvim_create_augroup("obsidian33_fugitive", {})

            local autocmd = vim.api.nvim_create_autocmd
            autocmd("BufWinEnter", {
                group = obsidian33_fugitive,
                pattern = "*",
                callback = function()
                    if vim.bo.ft ~= "fugitive" then
                        return
                    end

                    local bufnr = vim.api.nvim_get_current_buf()
                    local opts = { buffer = bufnr, remap = false }
                    vim.keymap.set("n", "<leader>p", function()
                        vim.cmd.Git("push")
                    end, opts, { desc = "Git: Push" })

                    -- rebase always
                    vim.keymap.set("n", "<leader>P", function()
                        vim.cmd.Git({ "pull", "--rebase" })
                    end, opts, { desc = "Git: Pull --rebase" })

                end
            })

            vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>", { desc = "Git: Diff get //2" })
            vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>", { desc = "Git: Diff get //3" })
        end,
    }
}
