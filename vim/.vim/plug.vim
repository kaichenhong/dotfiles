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

if (g:using_vim_plugin_data_dir)
        let g:plug_home = $HOME.'/.vim/plugged'
else
        let g:plug_home = has('nvim') ? stdpath('data') . '/plugged' : $HOME.'/.vim/plugged'
endif

if !isdirectory(g:plug_home)
        call mkdir(g:plug_home, "", 0700)
endif


" Plugins will be downloaded under the specified directory (g:plug_home)
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'google/vim-searchindex'

if has('nvim')

        " Interface ---> lualine
        Plug 'hoob3rt/lualine.nvim'
        Plug 'kyazdani42/nvim-web-devicons'

        " ONLY for neovim
        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-treesitter/nvim-treesitter'
        Plug 'folke/lsp-colors.nvim'
        Plug 'glepnir/lspsaga.nvim'
        Plug 'nvim-lua/completion-nvim'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'

else

        " Interface ---> airline
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

        Plug 'sheerun/vim-polyglot'
        Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

endif

Plug 'vivien/vim-linux-coding-style'

" List ends here. Plugins become visible to Vim after this call
call plug#end()

