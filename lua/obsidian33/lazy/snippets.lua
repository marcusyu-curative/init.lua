return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",

        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        config = function()
            local ls = require("luasnip")
            ls.filetype_extend("javascript", { "jsdoc" })

            -- TODO: What is expand?
            vim.keymap.set("i", "<C-s>e", function() ls.expand() end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-s>;", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-s>,", function() ls.jump(-1) end, { silent = true })

            vim.keymap.set({ "i", "s"}, "<C-E>", function()
                if ls.choice_active() then
                    ls.choice_send(1)
                end
            end, { silent = true })
        end,
    }
}
