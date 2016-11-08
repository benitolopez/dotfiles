" Make Vim more useful
set nocompatible

" Vim plugins
so ~/.vim/plugins.vim

" Use the Hybrid theme
syntax enable
set background=dark
colorscheme hybrid

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
"set breakindentopt=shift:4
" Show mode
set showmode
" Save buffer on switch
set autowrite
" Tab size
set tabstop=4
set shiftwidth=4
" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

"----- Easier Buffer Switching -----"
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

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
" Make it easy to edit the gvimrc file
nmap <Leader>eg :e ~/.gvimrc<cr>
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

" Select all shortcut
map <C-a> <esc>ggVG<CR>
" Fast saves
nmap <leader>w :w!<cr>
" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
" Down to the real next line
nnoremap j gj
nnoremap k gk

"----- EditorConfig -----"
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"----- CtrlP -----"

" Ignore files and folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" Search position
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
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

"----- Ack -----"
cnoreabbrev ag Ack
"let g:ackpreview = 0

if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

"----- Greplace -----"
set grepprg=ag
let g:grep_cmd_opts = '--line-number --noheading'

"----- Syntastic -----"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']

"----- Airline -----"

" Show open buffers when there's only one tab
let g:airline#extensions#tabline#enabled = 1
" Always show the status bar
set laststatus=2
" Use powerline symbols
let g:airline_powerline_fonts = 1
" Use powerline theme
let g:airline_theme="powerlineish"
" Hide default mode (already shown in Powerline)
set noshowmode
" Disable mix-indent detection
let g:airline#extensions#whitespace#enabled = 0

"----- File Types -----"
" Change scss files to css
au BufRead,BufNewFile *.scss set filetype=scss.css

" Reload Airline when source .vimrc
function! RefreshUI()
  if exists(':AirlineRefresh')
    AirlineRefresh
  else
    " Clear & redraw the screen, then redraw all statuslines.
    redraw!
    redrawstatus!
  endif
endfunction

" Automatically source the Vimrc file on save
augroup autosorcing
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC | :call RefreshUI()
	autocmd BufWritePost $MYVIMRC :call RefreshUI()
augroup END

" Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located.
" - Press Ctrl+] in a method to go to the file where the method is defined.
" - Press Ctrl+^ to go back to the previous location (buffer).
" - Press 'gg' to go to the top, Shift+g to the bottom.
" - Select text in visual mode then press Shift+s to type a surrounding tag
" - Example surrounding tag: 'cs a b' replaces the surrounding a with b
" - Example surrounding tag 2: 'ds a' deletes the surrounding a 
" - Double Esc to clear the highlight after search
" - Type ':ls' to list all opened buffers 
" - Shift+j joins the current line with the bottom line
" - Ctrl+o goes back to the previous edit point, and Ctrl+i goes forward
" - Press 'yiw' to yank a word
" - Press 'daw' to delete a word under the cursor, 'caw' to delete the word
"   and put in insert mode
" - Press 'o' to insert a new line below, Shift+o for a new line above
" - Press ,c<space> to toggle a comment
