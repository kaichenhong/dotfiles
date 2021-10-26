" Description: Keymaps


" General "{{{
" -----------------------------------------------------------------------------

" Remap ';' to ':'
nnoremap ; :


" Saving / with root permission
nmap <leader>w :w!<cr>
" command! W w !sudo tee > /dev/null %
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


" Select all
nmap <C-a> gg<S-v>G


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


" Disable highlight when <leader><esc> is pressed
map <silent> <leader><esc> :noh<cr>


" Move lines (maybe not working in some terminal)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

if has("mac") || has("macunix")
        nmap <D-Down> <A-j>
        nmap <D-Up> <A-k>
        vmap <D-Down> <A-j>
        vmap <D-Up> <A-k>
endif


" -----------------------------------------------------------------------------
" }}}





" Buffers "{{{
" -----------------------------------------------------------------------------

" Go to buffers 
" map <leader>l :bnext<cr>
map <Tab> :bnext<cr>
" map <leader>h :bprevious<cr>
map <S-Tab> :bprevious<cr>

" Switch current / previous buffer
nnoremap <Leader><tab> :e#<CR>


" Show all buffers
nnoremap <Leader>= :buffers<CR>:b


" Delete / Close the current buffer
" map <leader>dd :bdelete<cr>
" map <leader>dd :Bclose<cr>:tabclose<cr>gT
map <leader>dd :Bclose<cr>


" -----------------------------------------------------------------------------
" }}}





" Tabs "{{{
" -----------------------------------------------------------------------------

nmap <C-Tab> :tabnext<Return>
nmap <C-S-Tab> :tabprev<Return>


map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/


" -----------------------------------------------------------------------------
" }}}





" Windows "{{{
" -----------------------------------------------------------------------------

" Move between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l


" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-


" -----------------------------------------------------------------------------
" }}}

