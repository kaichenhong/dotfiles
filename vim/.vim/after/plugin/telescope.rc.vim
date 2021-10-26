if !exists('g:loaded_telescope') | finish | endif


" !!! Using Telescope Pickers !!!

" => File Pickers :
" --- Lists files in your current working directory, respects .gitignore.
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" --- Searches for the string under your cursor in your current working directory.
nnoremap <C-f> <cmd>lua require('telescope.builtin').grep_string()<cr>
" --- Search for a string in your current working directory and get results live as you type (respecting .gitignore)
nnoremap <leader><C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>

" => Vim Pickers :
" --- Lists open buffers in current neovim instance.
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
" --- Lists available help tags and opens a new window with the relevant help info on <cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" => Treesitter Pickers :
" Lists Function names, variables, from Treesitter!
nnoremap <leader>tt <cmd>lua require('telescope.builtin').treesitter()<cr>

" => telescope extension --- file_browser.
nnoremap <leader><enter> <cmd>Telescope file_browser path=%:p:h<cr>


lua << EOF
require('telescope').setup{
        defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                mappings = {
                        i = {
                                -- map actions.which_key to <C-h> (default: <C-/>)
                                -- actions.which_key shows the mappings for your picker,
                                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                                -- ["<C-h>"] = "which_key"
                        }
                }
        },

        pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker

                find_files = {
                        hidden = true
                },
        },

        extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure

                file_browser = {
                        -- disables netrw and use telescope-file-browser in its place
                        hidden = true,
                        hijack_netrw = true,
                        mappings = {
                                ["i"] = {
                                        -- your custom insert mode mappings
                                },
                                ["n"] = {
                                        -- your custom normal mode mappings
                                },
                        },
                },
        }
}

-- Load telescope extensions.
--
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require('telescope').load_extension('file_browser')
EOF

