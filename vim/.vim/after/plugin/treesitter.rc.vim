if !exists('g:loaded_nvim_treesitter')
        if has('nvim')
                echom "WARNING: Not loaded treesitter"
        endif
        finish
endif


lua <<EOF
require'nvim-treesitter.configs'.setup {
        -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        -- sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
        -- auto_install = true, -- Automatically install missing parsers when entering buffer
        -- ignore_install = {}, -- List of parsers to ignore installing

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers") end of setup!

        highlight = {
                enable = true, -- false will disable the whole extension
                disable = {},  -- list of language that will be disabled
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
        },
        indent = {
                enable = false,
                disable = {},
        },
}
EOF

