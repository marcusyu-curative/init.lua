require("obsidian33.remap")
require("obsidian33.lazy_init")
require("obsidian33.set")

local augroup = vim.api.nvim_create_augroup

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

vim.g.netrw_brows_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
