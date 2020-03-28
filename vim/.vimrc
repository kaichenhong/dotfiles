" *********************************************** "
"                                                 "
"         Personal preference .vimrc file         "
"                                                 "
" *********************************************** "


" *********************************************** "
"               General settings                  "
" *********************************************** "

" Get the defaults that most user wants.
try
	source $VIMRUNTIME/defaults.vim
catch
endtry


" Enable 256 colors in vim.
set t_Co=256


" *********************************************** "
"                Custom plugins                   "
" *********************************************** "

" ***   vim-airline   ***
"
" https://github.com/vim-airline/vim-airline
" https://www.vim.org/scripts/script.php?script_id=4661
"
" ***   vim-airline-themes   ***
"
" https://github.com/vim-airline/vim-airline-themes
"
" Use powerline fonts.
let g:airline_powerline_fonts=1
"
" Tab setting.
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
"
" Buffer setting.
"	buffer_nr_show : same number as ":buffers".
"	buffer_idx_mode : On the contrary.
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
"
" Format setting.
let g:ariline#extensions#tabline#formatter='unique_tail'


" ***   Powerline   ***
"
" [1] https://wiki.archlinux.org/index.php/Powerline
" [2] https://powerline.readthedocs.io/en/master/overview.html
"
" let g:powerline_pycmd="py3"


" ***   vim-search-index   ***
"
" https://github.com/google/vim-searchindex


" ***   indentLine   ***
"
" https://github.com/Yggdroot/indentLine


" ***   vim-polyglot   ***
"
" https://github.com/sheerun/vim-polyglot
"
" A lot of languages syntax highlight settings for use.


" ***   vim-cpp-enhanced-highlight   ***
"
" https://github.com/octol/vim-cpp-enhanced-highlight
"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
"
" There are two ways to highlight template functions.
"	Bellow first works in most cases, but can be a little slow on large files.
"	Second is a faster implementation but has some corner cases where it doesn't work.
" let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
"
" Highlighting of library concepts is enabled by
let g:cpp_concepts_highlight = 1
"
" Highlighting of user defined functions can be disabled by
" let g:cpp_no_function_highlight = 1


" ***   vim-linux-coding-style   ***
"
" https://github.com/vivien/vim-linux-coding-style
"
let g:linuxsty_patterns = [ "/usr/src/", "/linux", "/kernel" ]

nnoremap <silent> <leader>a :LinuxCodingStyle<cr>


" *********************************************** "
"                Editing behaviour                "
" *********************************************** "
set clipboard^=unnamed,unnamedplus


" For linux kernel coding style.
"   Highlight 81th column with vertical line.
set colorcolumn=81
" execute "set colorcolumn=" . join(range(81,335), ',').
highlight ColorColumn ctermbg=Black ctermfg=DarkRed


" Highlight trailing spaces
"
" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s+$/
if version >= 702
	autocmd BufWinLeave * call clearmatches()
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Ultimate vimrc
"
" https://github.com/amix/vimrc
"
"
" Maintainer:
"       Amir Salihefendic — @amix3k
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
" Extended:
"    -> etc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500


" Enable filetype plugins
filetype plugin on
filetype indent on


" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime


" Let ":find" command is recursive
set path+=**


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
map <space> ,


" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7


" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


" Turn on the Wild menu
set wildmenu


" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


"Always show current position
set ruler


" Height of the command bar
set cmdheight=1


" A buffer becomes hidden when it is abandoned
set hid


" Configure backspace so it acts as it should act
"   Incase can't delete in INSERT mode
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" Ignore case when searching
set ignorecase


" When searching try to be smart about cases
set smartcase


" Highlight search results
set hlsearch


" Makes search act like search in modern browsers
set incsearch


" Don't redraw while executing macros (good performance config)
" set lazyredraw


" For regular expressions turn magic on
set magic


" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
	autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1


" Show line numbers (hybrid), and do some highlight settings
set number relativenumber

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set number relativenumber
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &number | set norelativenumber | endif
augroup END

highlight LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE


" Show 'tab' and 'end of line' as CTRL-I is displayed.
" Set the characters you want to use.
"
" In GVim seems has some bug?
if !has("gui_running")
	set listchars=tab:»\ 
	" set listchars+=tab:»\
	set list
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
"   Make source code looks more colorfull, it will call <filetype on>
"
"       The ":syntax enable" command will keep your current color settings.
"       This allows using ":highlight" commands to set your preferred colors
"       before or after using this command.
"       If you want Vim to overrule your settings with the defaults,
"       use: "syntax on"
"
" syntax on
syntax enable


" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

if &term =~ '256color'
	" Disable Background Color Erase (BCE) so that color schemes
	" ender properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=


	" Use VIM true color support
	if has("termguicolors")
		" set termguicolors
	endif
endif


" Set background and color scheme
set background=dark

try
	colorscheme desert

	""""""""""""""""""""""""
	" Download colorscheme "
	""""""""""""""""""""""""

	" ***   peaksea   ***
	"
	" https://www.vim.org/scripts/script.php?script_id=760
	"
	" colorscheme peaksea


	" ***   mrkn256   ***
	"
	" https://github.com/mrkn/mrkn256.vim
	"
	" colorscheme mrkn256


	" ***   hybrid   ***
	"
	" https://github.com/w0ng/vim-hybrid
	"
	" let g:hybrid_custom_term_colors=1
	" let g:hybrid_reduced_contrast=1	" Remove this line if using the default palette.
	" colorscheme hybrid


	" ***   gruvbox   ***
	"
	" https://github.com/morhetz/gruvbox
	"
	" Change dark mode contrast. Possible values are soft, medium, hard.
	let g:gruvbox_contrast_dark='medium'
	"
	" Disable italic text in GUI mode.
	if has("gui_running")
		let g:gruvbox_italic=0
	endif
	"
	" Extra highlight strings.
	let g:gruvbox_improved_strings=1
	"
	" Extra highlight warnings.
	let g:gruvbox_improved_warnings=1
	"
	" Fix airline issue. "buffers" in top bar is grey.
	"
	" https://github.com/morhetz/gruvbox/issues/250
	"
	" If on right.
	autocmd VimEnter * hi! link airline_tablabel_right airline_tabtype
	if exists("##TerminalWinOpen")
		autocmd TerminalWinOpen * hi! link airline_tablabel_right airline_tabtype
	endif
	" If on left.
	" autocmd VimEnter * hi! link airline_tablabel airline_tabtype
	" if exists("##TerminalWinOpen")
	" 	autocmd TerminalWinOpen * hi! link airline_tablabel airline_tabtype
	" endif
	colorscheme gruvbox
catch
endtry


" Set highlight color. (override colorscheme settings)
highlight Search cterm=NONE ctermfg=grey ctermbg=blue


" Show cursorline
set cursorline
" highlight CursorLine term=NONE cterm=NONE gui=NONE
" highlight CursorLine ctermbg=darkred ctermfg=white guibg=darkgreen guifg=white


" Show cursorcolumn
set cursorcolumn
" highlight CursorColumn term=NONE cterm=NONE gui=NONE
" highlight CursorLine ctermbg=darkred ctermfg=white guibg=darkgreen guifg=white


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8


" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use / Don't use spaces instead of tabs
" set expandtab
set noexpandtab


" Be smart when using tabs ;)
set smarttab


" 1 tab == 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=0


" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" Auto completion settings
"	default: completeopt=menu,preview
"		https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone

" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" Enable Omni completion and combine settings for user complete
set omnifunc=syntaxcomplete#Complete

" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
			\ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
			\ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <C-space> ?


" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT


" Close all the buffers
map <leader>ba :bufdo bd<cr>


" Go to buffers (also see "Go to buffer by number" for detail)
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>


" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext


" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" Go to buffer by number
"
" https://vim.fandom.com/wiki/Easier_buffer_switching
"
" The :edit command can also be used to switch to a given buffer number
" if the argument begins with #.
nnoremap <Leader><tab> :e#<CR>
" nnoremap <Leader><tab> :b#<CR>
nnoremap <Leader>` :bprev<CR>
nnoremap <Leader>- :bnext<CR>
nnoremap <Leader>= :buffers<CR>:b
" nnoremap <Leader>1 :bfirst<CR>
" nnoremap <Leader>2 :2b<CR>
" nnoremap <Leader>3 :3b<CR>
" nnoremap <Leader>4 :4b<CR>
" nnoremap <Leader>5 :5b<CR>
" nnoremap <Leader>6 :6b<CR>
" nnoremap <Leader>7 :7b<CR>
" nnoremap <Leader>8 :8b<CR>
" nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :blast<CR>

" Use airline plugin to do.
"
" https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt
" search 'buffer_idx_mode' for detail.
"
try
	nmap <leader>1 <Plug>AirlineSelectTab1
	nmap <leader>2 <Plug>AirlineSelectTab2
	nmap <leader>3 <Plug>AirlineSelectTab3
	nmap <leader>4 <Plug>AirlineSelectTab4
	nmap <leader>5 <Plug>AirlineSelectTab5
	nmap <leader>6 <Plug>AirlineSelectTab6
	nmap <leader>7 <Plug>AirlineSelectTab7
	nmap <leader>8 <Plug>AirlineSelectTab8
	nmap <leader>9 <Plug>AirlineSelectTab9
	" nmap <leader>- <Plug>AirlineSelectPrevTab
	" nmap <leader>+ <Plug>AirlineSelectNextTab
catch
endtry


" Go to tab by number
" noremap <leader>1 1gt
" noremap <leader>2 2gt
" noremap <leader>3 3gt
" noremap <leader>4 4gt
" noremap <leader>5 5gt
" noremap <leader>6 6gt
" noremap <leader>7 7gt
" noremap <leader>8 8gt
" noremap <leader>9 9gt
" noremap <leader>0 :tablast<cr>


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^


" Remap ';' to ':'
nnoremap ; :


" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif

" Move a line of text using ALT+[jk]
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" Delete trailing white space on save, useful for some filetypes ;)
"
" https://vim.fandom.com/wiki/Remove_unwanted_spaces
"
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
	autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
	autocmd BufWritePre *.h,*.hpp :call CleanExtraSpaces()
	autocmd FileType c,cpp autocmd BufWritePre <buffer> :call CleanExtraSpaces()
endif


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>


" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>


" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight all instances of word under cursor, when idle.
"   Useful when studying strange source code.
"   Type z/ to toggle highlighting on/off.
"	Use 'n' and 'N' to jump between them like search results.
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
		setl updatetime=30
		echo 'Highlight current word: ON'
		return 1
	endif
endfunction

" autosave delay, cursorhold trigger, default: 4000ms
setl updatetime=30
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


" Returns true if paste mode is enabled
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	endif
	return ''
endfunction


" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")

	if buflisted(l:alternateBufNum)
		buffer #
	else
		bnext
	endif

	if bufnr("%") == l:currentBufNum
		new
	endif

	if buflisted(l:currentBufNum)
		execute("bdelete! ".l:currentBufNum)
	endif
endfunction


function! CmdLine(str)
	call feedkeys(":" . a:str)
endfunction


function! VisualSelection(direction, extra_filter) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", "\\/.*'$^~[]")
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'gv'
		call CmdLine("Ack '" . l:pattern . "' " )
	elseif a:direction == 'replace'
		call CmdLine("%s" . '/'. l:pattern . '/')
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extended:
"
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
" try
" 	if has("mac") || has("macunix")
" 		set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
" 	elseif has("win16") || has("win32")
" 		set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
" 	elseif has("gui_gtk2")
" 		set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
" 	elseif has("linux")
" 		set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
" 	elseif has("unix")
" 		set gfn=Monospace\ 11
" 	endif
" catch
" endtry
if has("gui_running")
	set guifont=DejaVu_Sans_Mono_for_Powerline:h9:cANSI:qDRAFT
	set guifont=MesloLGS_NF:h9:cANSI:qDRAFT
endif


" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=m	" menu +/-.
	set guioptions-=T	" tool bar +/-.
	set guioptions-=e	" GUI tabs +/-.

	" Disable scrollbars (real hackers don't use scrollbars for navigation!)
	set guioptions-=r	" right-hand scrollbar.
	set guioptions-=R	" right-hand scrollbar (vertically split).
	set guioptions-=l	" left-hand scrollbar.
	set guioptions-=L	" left-hand scrollbar (vertically split).
	set guioptions-=b	" buttom (horizontal) scrollbar.


	set t_Co=256
	set guitablabel=%M\ %t


	" Window size settings
	set lines=70
	set columns=120


	" Set highlight color. (override colorscheme settings)
	highlight Search guibg=peru guifg=wheat
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>e :e! ~/.vim_runtime/my_configs.vim<cr>
" autocmd! bufwritepost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
	set undodir=~/.vim_runtime/temp_dirs/undodir
	set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>


" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>


" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>


" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
" For C++
"	https://vim.fandom.com/wiki/Using_vim_as_an_IDE_all_in_one
"

" Enable global scope search
let OmniCpp_GlobalScopeSearch = 1

" Enable namespace search
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 0

" Show all members
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 0

" Show scope in abbreviation
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0

" Show function parameters
let OmniCpp_ShowPrototypeInAbbr = 1

" Show access information in pop-up menu
let OmniCpp_ShowAccess = 1

" Auto complete after '.'
let OmniCpp_MayCompleteDot = 1

" Auto complete after '->'
let OmniCpp_MayCompleteArrow = 1

" Auto complete after '::'
let OmniCpp_MayCompleteScope = 1

" Don't select first item in pop-up menu
let OmniCpp_SelectFirstItem = 0


autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
	let g:cmd = getcmdline()

	if has("win16") || has("win32")
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
	else
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
	endif

	if g:cmd == g:cmd_edited
		if has("win16") || has("win32")
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
		else
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
		endif
	endif

	return g:cmd_edited
endfunc


func! CurrentFileDir(cmd)
	return a:cmd . " " . expand("%:p:h") . "/"
endfunc
