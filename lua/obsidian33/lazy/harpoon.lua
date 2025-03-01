return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },

        config = function()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup()
            -- REQUIRED

            vim.keymap.set("n", "<leader>A", function()
                harpoon:list():prepend()
            end, { desc = "Harpoon: Prepend to list" })

            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end, { desc = "Harpoon: Add to list" })

            vim.keymap.set("n", "<C-e>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon: Show list" })

            vim.keymap.set("n", "<C-j>", function()
                harpoon:list():select(1)
            end, { desc = "Harpoon: Select 1" })

            vim.keymap.set("n", "<C-k>", function()
                harpoon:list():select(2)
            end, { desc = "Harpoon: Select 2" })

            vim.keymap.set("n", "<C-l>", function()
                harpoon:list():select(3)
            end, { desc = "Harpoon: Select 3" })

            -- Doesn't work: Mac does not send <C-;> to the terminal
            vim.keymap.set("n", "<C-;>", function()
                harpoon:list():select(4)
            end, { desc = "Harpoon: Select 4" })

            vim.keymap.set("n", "<leader><C-j>", function()
                harpoon:list():replace_at(1)
            end, { desc = "Harpoon: Replace 1" })

            vim.keymap.set("n", "<leader><C-k>", function()
                harpoon:list():replace_at(2)
            end, { desc = "Harpoon: Replace 2" })

            vim.keymap.set("n", "<leader><C-l>", function()
                harpoon:list():replace_at(3)
            end, { desc = "Harpoon: Replace 3" })

            vim.keymap.set("n", "<leader><C-;>", function()
                harpoon:list():replace_at(4)
            end, { desc = "Harpoon: Replace 4" })

            vim.keymap.set("n", "<C-P>", function()
                harpoon:list():prev()
            end, { desc = "Harpoon: Previous" })

            vim.keymap.set("n", "<C-N>", function()
                harpoon:list():next()
            end, { desc = "Harpoon: Next" })
        end
    }
}

