if has('nvim')
  let s:editor_root=expand("~/.config/nvim")
else
  let s:editor_root=expand("~/.vim")
endif

call plug#begin('~/.local/share/nvim/plugged')

" Language Specific Packages
" HTML
Plug 'othree/html5.vim' " HTML5 syntax enhancements
" Javascript
Plug 'prettier/vim-prettier' " Format javasript
Plug 'pangloss/vim-javascript' " Better es6/es2015 syntax support
" EmberJS
Plug 'joukevandermaas/vim-ember-hbs'

" File explorer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1

" Fuzzy search engine
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git packages
Plug 'tpope/vim-fugitive' " Git integration for vim
Plug 'airblade/vim-gitgutter' " Show git edit annotations in the gutter
set signcolumn=yes
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✎'
let g:gitgutter_sign_removed = '－'
let g:gitgutter_sign_removed_first_line = '－'
let g:gitgutter_sign_modified_removed = '✎'

" Autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
  \]
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'buffer', 'ultisnips', 'ternjs']
let g:deoplete#enable_at_startup = 1
set completeopt=longest,menuone

" Autocomplete sources
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && sudo npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1

" Snippets
Plug 'SirVer/ultisnips' " Snippet manager
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips" " personal snippets directory
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"

" Utilites
Plug 'mileszs/ack.vim' " Vim ack/ag integration
let g:ackhighlight = 1
if executable('ag')
  " Use ag (the silver searcher) if it's installed
  let g:ackprg = 'ag --vimgrep'
endif

Plug 'mhinz/vim-startify' " Fancy start screen showing recently edited files
let g:startify_custom_header = []
let g:startify_list_order = [
  \ ['Sessions'], 'sessions',
  \ ['Recently Modified in Current Directory'], 'dir',
  \ ['Recently Modified Globally'], 'files',
  \ ['Bookmarks'], 'bookmarks',
  \ ['Commands'], 'commands',
\]
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1

Plug 'easymotion/vim-easymotion' " Make moving even easier
Plug 'jiangmiao/auto-pairs' " Automatically insert pairs of quotes/braces/brackets while typing
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing/unnecessary whitespace
Plug 'qpkorr/vim-bufkill' " Kill buffer without killing the split/window
Plug 'jackson-dean/BufOnly.vim' " Delete all hidden buffers leaving only the currently active
Plug 'majutsushi/tagbar' " Toggle file structure diagrams using ctags
Plug 'tpope/vim-commentary' " Kill buffer without killing the split/window
Plug 'tpope/vim-surround' " Plugin for working with quotes/braces/brackets etc
Plug 'ervandew/supertab' " Plugin for working with quotes/braces/brackets etc

" For work
Plug 'git://gitli.corp.linkedin.com/jcdean/vim-pemberly.git'

" Status Bar
Plug 'vim-airline/vim-airline' " Fancy statusbar
Plug 'vim-airline/vim-airline-themes' " Themes for fancy statusbar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_x = '%{hostname()}'
let g:airline_theme='badwolf'

" Refresh vim-airline after sourcing vimrc
if exists('g:loaded_airline')
  AirlineRefresh
endif

" Linter
Plug 'w0rp/ale'
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '✖'

" Indent guides
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┆'

" Color themes
Plug 'chriskempson/base16-vim'
Plug 'trevordmiller/nova-vim'

call plug#end()

filetype plugin indent on " Allow smart indentation and filetype detection
syntax enable " Turn on syntax highlighting

set encoding=utf8 " Set charset to utf8 (Necessary for fancy icon plugins)
set t_Co=256 " Enable pretty colors
set number " Turn on line numbers
set bg=dark " Dark background
set hidden " Allow 'hidden' buffers
set nowrap " Disable line auto wrapping
set fillchars+=vert:\┋ " Solid pipe character for window split icon
set cursorline " highlight current line
set cmdheight=2 " Increase command line height
set numberwidth=5 " Gutter width
set autoread " Auto re-read files that have changes outside of vim
set lazyredraw " Don't redraw while executing macros
set signcolumn=yes " Always show the signcolumn
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

set foldmethod=indent
set foldlevelstart=99

set wildmenu " Show completion options (filenames, plugin functions, etc) in a traversable menu
set wildignore+=*/bower_components/*,*/node_modules/*,*/.git/*,*/tmp/* " What to ignore for filename completion suggestions

set termguicolors
colorscheme base16-onedark

" Make cursor skinny on insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Force .src files to use xml syntax
au BufNewFile,BufRead *.src setlocal ft=xml
" Force .pdsc files to use json syntax
au BufNewFile,BufRead *.pdsc setlocal ft=json

" strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" source vimrc after writing to it
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Personal key remapping
let mapleader=","
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
vnoremap > ><CR>gv
vnoremap < <<CR>gv
map <silent><C-p> :exe 'FZF '.$PWD<CR>
map <silent><C-n><C-t> :NERDTreeToggle<CR>
map <S-Tab> :bnext<CR>
map gf :vertical wincmd f<CR>
inoremap jj <Esc>
vnoremap // y/<C-R>"<CR>"
map <Leader>rf :PemberlyRelatedFile<CR>
nnoremap <Leader>ra :Ack!<Space>'<C-R>"'
nnoremap <Leader>a :Ack!<Space>
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>
nnoremap <silent> <S-left> :vertical resize -10<CR>
nnoremap <silent> <S-right> :vertical resize +10<CR>
nnoremap <silent> <S-up> :resize +10<CR>
nnoremap <silent> <S-down> :resize -10<CR>
nnoremap <silent> <Leader><CR> o<Esc>
nnoremap <silent> <Leader>c :noh<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>tb :TagbarToggle<CR>

" neovim terminal settings
" there can be an only be one!
if has('nvim')
  function! OpenTerminal()
    let l:termBuffers = filter(map(copy(getbufinfo()), 'v:val.name'), 'v:val =~ "term://"')
    if (len(l:termBuffers))
      let l:termBuffer = l:termBuffers[0]
      let l:bufferDictionary = getbufinfo(l:termBuffer)[0]
      if (l:bufferDictionary['hidden'])
        exec 'bot sb '.l:termBuffers[0]
      endif
    else
      split | terminal
    endif
    startinsert
  endfunction
  command! Term execute 'call OpenTerminal()'
  tnoremap <silent> <Leader>t <C-\><C-n>:q<CR>
  nnoremap <silent> <Leader>t :Term<CR>
endif

" TODO: move to vim-pemberly plugin?
function! FindReferences()
  set isk+=/,-
  let l:ref = expand('<cword>')
  execute 'Ack! ' . l:ref
  set isk-=/,-
endfunction

" Personal commands
command! FindRefs execute 'call FindReferences()'
command! DiffOn execute 'windo diffthis'
command! DiffOff execute "diffoff!"
command! Vrc execute "vsplit ".$MYVIMRC
command! Gdmaster execute "Gvsplit master:%"
command! EditInit execute "vsplit ~/.config/nvim/init.vim"
command! -range SendSelectionToRemote execute "<line1>,<line2>w! ".$HOME."/yanked.txt | !scp ~/yanked.txt ".$VIM_REMOTE_USER."@".$VIM_REMOTE_HOST.":~/yanked.txt && ssh ".$VIM_REMOTE_USER."@".$VIM_REMOTE_HOST." 'pbcopy < ~/yanked.txt'"
command! ResetWorkspace execute 'Startify | BufOnly'

" Do custom highlighting at the end so it doesn't get inadvertantly cleared
highlight ALEErrorSign ctermfg=NONE ctermbg=NONE guifg=red guibg=#353b45
highlight ALEWarningSign ctermfg=NONE ctermbg=NONE guifg=yellow guibg=NONE
syntax match InlineURL /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/
highlight link InlineURL KeyWord
