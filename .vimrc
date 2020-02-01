set nocompatible " Disable legacy vi compatiblity
filetype plugin indent on " Allow smart indentation and filetype detection
set encoding=utf8 " Set charset to utf8 (Necessary for fancy icon plugins)
syntax enable " Turn on syntax highlighting
set t_Co=256 " Enable pretty colors
set number " Turn on line numbers
set bg=dark " Dark background
set hidden " Allow 'hidden' buffers
set nowrap " Disable line auto wrapping
set fillchars+=vert:\┋ " Solid pipe character for window split icon
set cmdheight=2 " Increase command line height
set numberwidth=5 " Gutter width
set autoread " Auto re-read files that have changes outside of vim
set lazyredraw " Don't redraw while executing macros
set pastetoggle=<F2> " Quick paste toggle

" Swap/Backup file settings
set noswapfile " no more weirdo swap files
set nobackup " no more weirdo backup files
set backupdir=$HOME/.backup " Where backups would go if we had them
set dir=$HOME/.swap " Where swap files would go if we had them

" Split/window behavior
set splitright " Open vertical splits/windows to the right by default
set splitbelow " Open horizontal splits/windows to the bottom by default
set switchbuf=useopen " Switch to active window if attempting to split an already active buffer

" Search settings
set ignorecase " case-insensitive searching
set smartcase " make search case-sensitive if search term contains mixed case
set hlsearch " Highlight search pattern matches
set incsearch " Add live highlighting to matches while typing search term


" Indentation settings
set expandtab " Convert tabs to spaces
let g:indentation_depth = 2 " Number of spaces to indent
let &shiftwidth=g:indentation_depth " Set distance to move lines or blocks
let &tabstop=g:indentation_depth " Set tab character width
let &softtabstop=g:indentation_depth " Set space added by pressing tab key and removed by pressing backspace
let &backspace=g:indentation_depth " Make backspace work like a sane person would expect

" Netrw settings
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

set foldmethod=indent
set foldlevelstart=99

set wildmenu " Show completion options (filenames, plugin functions, etc) in a traversable menu
set wildignore+=*/bower_components/*,*/.git/*,*/concat-stats-for/* " What to ignore for filename completion suggestions

" Make cursor skinny on insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Force .src files to use xml syntax
au BufNewFile,BufRead *.src setlocal ft=xml
au BufNewFile,BufRead *.pdsc setlocal ft=json

set termguicolors
colorscheme slate
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" source vimrc after writing to it
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Personal key remapping
let mapleader=","
map <Leader>p "0p
map <S-Tab> :bnext<CR>
map gf :vertical wincmd f<CR>
map <C-n><C-t> :Vexplore<CR>
nnoremap <silent> <S-left> :vertical resize -10<CR>
nnoremap <silent> <S-right> :vertical resize +10<CR>
nnoremap <silent> <S-up> :resize +10<CR>
nnoremap <silent> <S-down> :resize -10<CR>
nnoremap <silent> <Leader><CR> o<Esc>
nnoremap <silent> <Leader>c :noh<CR>
inoremap jk <Esc>
vnoremap // y/<C-R>"<CR>"
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
vnoremap > ><CR>gv
vnoremap < <<CR>gv
