" Description: Functions


" Clean extra spaces "{{{
" -----------------------------------------------------------------------------

" Delete trailing white space on save, useful for some filetypes ;)
" https://vim.fandom.com/wiki/Remove_unwanted_spaces
fun! CleanExtraSpaces()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        silent! %s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfun

if has("autocmd")
        " For all filetype use
        " autocmd BufWritePre :call CleanExtraSpaces()

        " For specify a particular filetype use
        autocmd BufWritePre *.txt,*.js,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
        autocmd BufWritePre *.h,*.hpp :call CleanExtraSpaces()
        autocmd FileType c,cpp,python autocmd BufWritePre <buffer> :call CleanExtraSpaces()
endif


" -----------------------------------------------------------------------------
" }}}





" Convert leading space to tabs "{{{
" -----------------------------------------------------------------------------

" Convert leading space to tabs, useful for some filetypes ;)
fun! ConvertLeadingSpacesToTabs()
        let save_cursor = getpos(".")
        let old_query = getreg('/')

        " Search for every instance of 4 consecutive spaces (after the = character),
        " but only if the entire line up to that point is whitespace
        " (this uses the zero-width look-behind assertion, \@<=).
        silent! %s/\(^\s*\)\@<=    /\t/g
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfun


" -----------------------------------------------------------------------------
" }}}





" Auto highlight "{{{
" -----------------------------------------------------------------------------

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
        let @/ = ''
        if exists('#auto_highlight')
                au! auto_highlight
                augroup! auto_highlight
                setl updatetime=4000
                echo 'Highlight current word: off'
                return 0
        else
                augroup auto_highlight
                au!
                au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
                augroup end
                setl updatetime=3
                echo 'Highlight current word: ON'
                return 1
        endif
endfunction


" autosave delay, cursorhold trigger, default: 4000ms
setl updatetime=3

" highlight the word under cursor (CursorMoved is inperformant)
highlight WordUnderCursor cterm=underline gui=underline
autocmd CursorHold * call HighlightCursorWord()
function! HighlightCursorWord()
        " if hlsearch is active, don't overwrite it!
        let search = getreg('/')
        let cword = expand('<cword>')
        if match(cword, search) == -1
                exe printf('match WordUnderCursor /\V\<%s\>/', escape(cword, '/\'))
        endif
endfunction


" Highlight trailing spaces
" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s+$/
if version >= 702
        autocmd BufWinLeave * call clearmatches()
endif

" -----------------------------------------------------------------------------
" }}}

