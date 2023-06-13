
"let data_dir = has("nvim") ? stdpath("data") . "/site" : "~/.vim"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . "/autoload/plug.vim"))
  silent execute "!curl -fLo ".data_dir."/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
Plug 'tpope/vim-surround'
call plug#end()

" Don't bother vim to be compatible with vi
"set nocompatible

syntax enable
filetype plugin on

" Fuzzy file finder
set path+=**
set wildmenu

set number
set relativenumber
set autoindent

set clipboard=unnamedplus
"set clipboard=unnamed


" Scala Syntax Highlighting
"au BufRead,BufNewFile *.scala set filetype=scala
"au! Syntax scala source ~/.vim/syntax/scala.vim

" Highlight search results: Yes or No?
set nohlsearch

" Folding -- save view
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

" The next line makes code comments in vim in a blue color that is more readable
" (The default blue is less readable)
set background=dark


"":execute "norm yss\"I<a href=\<Esc>A>***</a>"
":map <leader>p 0yi":!zathura <C-R>" & disown<CR><CR>
":map <leader>p 0yi":!zathura "<C-R>"" & <CR><CR>
" Display \t, eol, etc.
set list

"" Auto kill after some file update
"" sxhkd
"autocmd BufWritePost *sxhkdrc !killall sxhkd; setsid sxhkd &
"autocmd BufWritePost *sxhkdrc !killall sxhkd; setsid -c sxhkd &
autocmd BufWritePost ~/.config/sxhkd/sxhkdrc !killall sxhkd; setsid -w sxhkd &
"" sxiv
autocmd BufWritePost ~/.Xresources !xrdb ~/.Xresources

"" Spell check (English) set to F6
map <F6> :setlocal spell! spelllang=en_us<CR>
"map <F2> :r $HOME/programming/html/templates/pre-only.html<CR>
"autocmd FileType md nnoremap ;r :r ~/programming/html/templates/pre-only.html<C-R><Esc>
nnoremap ;r Gi<Enter><Enter><Enter><Esc>:r ~/programming/html/templates/pre-only.html<CR>
"autocmd FileType md nnoremap ;r Gi<Enter><Enter><Enter><Esc>:r ~/programming/html/templates/pre-only.html
"autocmd FileType md nnoremap ;r :r ~/programming/html/templates/pre-only.html
"" html tags
""autocmd FileType html,md inoremap ;p <p></p><Esc>FpT>i
"autocmd FileType html inoremap ;p <p></p><Esc>FpT>i
"autocmd FileType md inoremap ;p <p></p><Esc>FpT>i
"autocmd FileType md inoremap ;c <pre></pre><Esc>FpT>i
""autocmd FileType html,md inoremap ;em <em></em><Esc>?eT>i
"autocmd FileType html inoremap ;em <em></em><Esc>?eT>i
autocmd FileType html,markdown,python inoremap ;em <em></em><Esc>FeT>i
autocmd FileType html inoremap ;b <b></b><Esc>FbT>i
autocmd FileType markdown,python,julia inoremap ;b ****<Esc>hi
autocmd FileType html inoremap ;c <code></code><Esc>?c<CR>T>i
autocmd FileType markdown,python,sh inoremap ;c ``<Esc>i
autocmd FileType html,markdown,python inoremap ;pre <pre><CR><CR></pre><Esc>ki
autocmd FileType html,markdown inoremap ;t &lt;&gt;<Esc>?g<CR>hi

"" Indentation for C, scala, LaTeX, etc.: 2 spaces
autocmd FileType tex,c,cpp,scala,sh,html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType julia setlocal shiftwidth=4 tabstop=4 expandtab
"autocmd FileType py setlocal shiftwidth=4 tabstop=4
"" python-specific
autocmd FileType html,markdown,python inoremap ;f "{}".format()<Esc>i
"" surround with **, i.e. bold face for markdown
autocmd FileType markdown,python let b:surround_{char2nr('b')} = "**\r**"

"nnoremap <F3>:set hlsearch!<CR>
"map <F7>:noh<CR>
map <F12> :ColorHighlight<CR>
"" Capitalize the 1st letter of every word in the current line
"map <F10> :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>
map <F10> :s/\<./\u&/g<CR>
"" \<    start of a word
"" &     whatever is matched
"" ^     start of a line
"" \u    uppercase

"" Practice (The Hard Way)
nmap - ddp
nmap _ o<esc>ddkP2jdd2k


"" Change split behaviour (The default being `left/above`)
set splitright
set splitbelow

"" Shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" To always show status line at the bottom
" 0: Never, 1: when during multi splits, 2: Always
set laststatus=2
" statusline (or stl) configures what are displayed
"set statusline+=\ %f

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
