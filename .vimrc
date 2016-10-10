" Make Vim more useful
set nocompatible

" Vim plugins
so ~/.vim/plugins.vim

" Use the Solarized Dark theme
syntax enable
set background=dark
colorscheme atom-dark

" Allow backspace in insert mode
set backspace=indent,eol,start
" Change mapleader
let mapleader=","
" Enable line numbers
set number
" Highlight searches
set hlsearch
" Highlight dynamically as pattern is typed
set incsearch
" Ignore case of searches
set ignorecase
" No damn bells!
set noerrorbells visualbell t_vb=
" Better wrap
set breakindent

"----- Split Management -----"
set splitbelow
set splitright

map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-H> <C-W><C-H>
map <C-L> <C-W><C-L>

"----- Mappings -----"

" Make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
" Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>
" Make it easy to edit the snippets file
nmap <Leader>es :e ~/.vim/snippets/
" Make it easy to edit the Vim plugins file
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>
" Clear highlight with a double Esc
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" Better copy/paste shortcuts
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"----- CtrlP -----"

" Ignore files and folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" Search position
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
" Use Alt to invoke CtrlP
nmap <a-p> :CtrlP<cr>
" Find in buffer
nmap <a-R> :CtrlPBufTag<cr>
" Find in MRU
nmap <a-E> :CtrlPMRUFiles<cr>

"----- NERDTree -----"

let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1
" Toggle NERDTree
nmap <a-1> :NERDTreeToggle<cr>

"----- CTags -----"
nmap <Leader>f :tag<space>

"----- Greplace -----"
set grepprg=ag
let g:grep_cmd_opts = '--line-number --noheading'

" Automatically source the Vimrc file on save
augroup autosorcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located.
" - Press Ctrl+] in a method to go to the file where the method is defined.
" - Press Ctrl+^ to go back to the previous location (buffer).
" - Press 'gg' to go to the top, Shift+g to the bottom.
" - Select text in visual mode then press Shift+s to type a surrounding tag
