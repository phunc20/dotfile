" Luke Smith's LaTeX vim setting
"execute pathogen#infect()
syntax on
filetype plugin indent on

" :FZF
"set rtp+=/usr/bin/fzf

"" neovim's vim-plug plugin: https://stsewd.dev/posts/neovim-plugins/
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'chrisbra/Colorizer'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'puremourning/vimspector'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"Plug 'rust-lang/rust.vim'
call plug#end()

set nocompatible    " be iMproved. Obligatory
filetype off        " Obligatory

" The following line is to have the vim editor display line numbers.
set number relativenumber

set statusline=%f   " Short current file path
set statusline+=%=  " Start appending from the right (instead of from the left)
set statusline+=\col=%c\ \row=%l\/%L  " Cursor's position

set list

let mapleader = ";"

" Capitalize the first char of every word on the line of the cursor
" Cf. <https://stackoverflow.com/questions/17440659/capitalize-first-letter-of-each-word-in-a-selection-using-vim>
nnoremap <leader>U :s/\<./\u&/g<CR>
"nnoremap <leader>U : s/\v<(.)(\w*)/\u\1\L\2/g
" The inverse
"nnoremap <leader>u :s/\<./\l&/g<CR>


" I do not understand fully the following 2 lines' meaning,
" I just know it is about tab and space.
"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 

" The following line means:
" maps every single tab stroke to 4 spaces.
" When using this line, you can no longer type \t or ^I,
" i.e. tab, using the tab key on your keyboard.
" However, you can disactivate it if you'd like to have
" ^I in your document.
"set tabstop=4 shiftwidth=4 expandtab

" Share system clipboard btw vim and other apps
set clipboard=unnamedplus

set autoindent

" https://github.com/tpope/vim-markdown
"let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" ================================================================
" thoughtbot's suggestion (max cantor)
" enter the current millenium
"set nocompatible

" enable syntax and plugins (for netrw) 
" and some more colors
syntax enable

"filetype plugin on
" ---------------------------------------

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer
" ---------------------------------------



" ================================================================


" Scala Syntax Highlighting
"au BufRead,BufNewFile *.scala set filetype=scala
"au! Syntax scala source ~/.vim/syntax/scala.vim

" Highlight search results: Yes or No?
set nohlsearch

" Folding -- save view
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

"" The next line makes code comments in vim in a blue color that is more readable
"" (The default blue is less readable)
set background=dark



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
autocmd FileType markdown,python,julia inoremap ;c ``<Esc>i
autocmd FileType html,markdown,python inoremap ;pre <pre><CR><CR></pre><Esc>ki
autocmd FileType html,markdown inoremap ;t &lt;&gt;<Esc>?g<CR>hi

"" Indentation for C, scala, LaTeX, etc.: 2 spaces
autocmd FileType tex,c,cpp,scala setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType tex inoremap <Leader>b \begin{}<CR>\end{}
autocmd FileType julia setlocal shiftwidth=4 tabstop=4 expandtab

"" python-specific
"autocmd FileType html,markdown,python inoremap ;f "{}".format()<Esc>i
autocmd FileType html,markdown,python inoremap ;f "f{}"<Esc>?}<CR>i
"autocmd BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix


"" surround with **, i.e. bold face for markdown
autocmd FileType markdown,python,julia let b:surround_{char2nr('b')} = "**\r**"

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

"" Change split behaviour (The default being `left/above`)
set splitright
set splitbelow

"" Shortcuts for split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" prev/next line same indent
nnoremap pi :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR><CR>
nnoremap ni :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR><CR>

""" Folding
"set foldmethod=indent
"set foldlevel=99

"" auto-save fold views
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent loadview
augroup END

"augroup MyPassListener
"  autocmd!
"  autocmd InsertCharPre * if s:RecordCharacter(v:char) | let v:char='*' | endif
"augroup END
"
"let s:pass = ""
"
"function! s:RecordCharacter(c)
"  let s:pass .= c
"  " Maybe do something special here if the character is a carriage return
"  return 1
"endfunction
"
"augroup MyPassListener
"  autocmd!
"augroup END

" Opacity
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" https://github.com/numirias/semshi
let g:semshi#error_sign=v:false
