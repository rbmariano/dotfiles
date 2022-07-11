-----------------------------------------------------------
-- Indent Blankline configuration file
----------------------------------------------------------

-- Plugin: indent_blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    use_treesitter = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
