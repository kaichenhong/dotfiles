" *********************************************** "
"                                                 "
"         Personal preference .vimrc file         "
"                                                 "
" *********************************************** "


" *********************************************** "
"               General settings                  "
" *********************************************** "

" Get the defaults that most user wants.
source $VIMRUNTIME/defaults.vim


" Enable 256 colors in vim.
set t_Co=256


" *********************************************** "
"                Custom plugins                   "
" *********************************************** "

" Powerline settings, see [1] and [2].
" [1] https://wiki.archlinux.org/index.php/Powerline
" [2] https://powerline.readthedocs.io/en/master/overview.html
let g:powerline_pycmd="py3"



" vim-cpp-enhanced-highlight settings, see [1].
" [1] https://github.com/octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
" let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
" let g:cpp_no_function_highlight = 1
let c_no_curly_error=1


" *********************************************** "
"                Editing behaviour                "
" *********************************************** "


" *********************************************** "
"                   UI settings                   "
" *********************************************** "

" Show statusline / tabline.
" By default, the statusline / tabline (and therefore Powerline) only appears when there are multiple windows open.
" To show it all the time, use
set laststatus=2
set showtabline=2
" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)


" Show line numbers (hybrid), and do some highlight settings.
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &number | set norelativenumber | endif
augroup END

highlight LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE


" Show cursorline
" set cursorline
