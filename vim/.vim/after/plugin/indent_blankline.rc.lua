local status, indent_blackline = pcall(require, "indent_blankline")
if (not status) then return end


vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    use_treesitter = true,
    -- show_end_of_line = true,
    -- space_char_blankline = " ",
    -- show_current_context = true,
    show_trailing_blankline_indent = false,
}

