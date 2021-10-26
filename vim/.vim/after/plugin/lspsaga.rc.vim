" if !exists('g:loaded_lspsaga') | finish | endif
if exists('g:loaded_lspsaga') | finish | endif
if !has('nvim') | finish | endif

lua << EOF
require('lspsaga').setup({
        ui = {
                winblend = 10,
                border = 'rounded',
                colors = {
                normal_bg = '#002b36'
                }
        }
})


local keymap = vim.keymap.set
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Peek Definition
-- you can edit the definition file in this float window
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
-- keymap("n", "gf", "<cmd>Lspsaga peek_definition<CR>")
-- Go to Definition
keymap("n","gf", "<cmd>Lspsaga goto_definition<CR>")

-- Float terminal
keymap({"n", "t"}, "<leader><C-t>", "<cmd>Lspsaga term_toggle<CR>")

EOF

