" Description: vim-plug for plugin


" vim-plug info "{{{
" -----------------------------------------------------------------------------
" Setting up vim-plug (manually)
" Vim (~/.vim/autoload)
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Neovim (~/.local/share/nvim/site/autoload)
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" -----------------------------------------------------------------------------
" }}}





" Flag for vim / neovim plugin data directory
let g:using_vim_plugin_data_dir = 1
let g:re_direct_to_custom_path = 0

if (g:using_vim_plugin_data_dir)
        let g:plug_home = $HOME.'/.vim/plugged'
else
        let g:plug_home = has('nvim') ? stdpath('data') . '/plugged' : $HOME.'/.vim/plugged'
endif

if !isdirectory(g:plug_home)
        call mkdir(g:plug_home, "", 0700)
endif

if ((g:re_direct_to_custom_path) && (has("win16") || has("win32") || has("win64")))
        echo "User CFG - set re_direct_to_custom_path flag!"
        let g:plug_home = 'L:\.vim\plugged'
endif


" Plugins will be downloaded under the specified directory (g:plug_home)
call plug#begin()


Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'google/vim-searchindex'

if has('nvim')

        " Interface ---> lualine + bufferline
        " lualine required dependencies
        Plug 'nvim-lualine/lualine.nvim'
        " ==> If you want to have icons in your statusline choose one of these
        Plug 'nvim-tree/nvim-web-devicons'
        " bufferline required dependencies
        Plug 'akinsho/bufferline.nvim'

        " neovim built-in supports (LSP & treesitter) required dependencies
        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'glepnir/lspsaga.nvim'        " LSP UIs

        " nvim-cmp required dependencies
        Plug 'onsails/lspkind-nvim'        " adds vscode-like pictograms
        Plug 'L3MON4D3/LuaSnip'            " snippet engine
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/nvim-cmp'

        " telescope required dependencies
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'nvim-telescope/telescope-file-browser.nvim'

        " Plug 'lukas-reineke/indent-blankline.nvim'

else

        " Interface ---> airline
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

        Plug 'sheerun/vim-polyglot'
        Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

endif

Plug 'vivien/vim-linux-coding-style'

" Color scheme
Plug 'overcache/NeoSolarized'

" Set color scheme that you want to use/load
let g:colorscheme_neosolarized = 1


" List ends here. Plugins become visible to Vim after this call
call plug#end()

