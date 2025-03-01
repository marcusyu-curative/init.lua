require("obsidian33.remap")
require("obsidian33.lazy_init")
require("obsidian33.set")

local augroup = vim.api.nvim_create_augroup
local obsidian33Group = augroup("obsidian33", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

-- Highlight yanked text
autocmd("TextYankPost", {
		group = yank_group,
		pattern = "*",
		callback = function()
				vim.highlight.on_yank({
						higroup = "IncSearch",
						timeout = 40,
				})
		end,
})

vim.filetype.add({
		extension = {
				templ = 'templ',
		},})

autocmd("LspAttach", {
    group = obsidian33Group,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end,
})

autocmd("BufWritePre", {
    pattern = { "*.tf", "*.hcl", "*.tfvars" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

autocmd("FileType", {
    pattern = "typescriptreact",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.expandtab = true
    end,
})

vim.g.netrw_brows_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

