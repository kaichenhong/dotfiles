if !exists('g:loaded_completion') | finish | endif


" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

set completeopt=menuone,noinsert,noselect

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


let g:completion_confirm_key = ""
let g:completion_chain_complete_list = {
\ 'default' : {
\   'default': [
\       {'complete_items': ['lsp', 'snippet', 'path']},
\       {'mode': '<c-p>'},
\       {'mode': '<c-n>'}],
\   'comment': []
\   }
\}


let g:completion_trigger_keyword_length = 2 " default = 1

let g:completion_trigger_on_delete = 1

