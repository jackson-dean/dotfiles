let s:editor_root=expand("~/.config/nvim")
call plug#begin('~/.local/share/nvim/plugged')

" Language Specific Packages
" HTML
Plug 'othree/html5.vim' " HTML5 syntax enhancements
" Javascript
Plug 'prettier/vim-prettier' " Format javasript
Plug 'pangloss/vim-javascript' " Better es6/es2015 syntax support
" EmberJS
Plug 'joukevandermaas/vim-ember-hbs'

" File explorer: Loads lazily so the drawer must be open in order to use
" things like NERDTreeFind
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1

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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
  \]
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#enable_smart_case = 1
set completeopt+=noinsert,menuone " auto-select first menu item. show menu even for a single result
set completeopt-=preview " Disable doc preview mode
autocmd CompleteDone * silent! pclose! " If we show the preview, make sure it is closed once something is selected
inoremap <expr><tab> pumvisible() ? "\<C-y>" : "\<tab>"

" Autocomplete sources
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && sudo npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Snippets
Plug 'SirVer/ultisnips' " Snippet manager
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips" " personal snippets directory
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"

" Misc utilities
Plug 'Shougo/denite.nvim'
Plug 'easymotion/vim-easymotion' " Make moving even easier
Plug 'jiangmiao/auto-pairs' " Automatically insert pairs of quotes/braces/brackets while typing
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing/unnecessary whitespace
Plug 'qpkorr/vim-bufkill' " Kill buffer without killing the split/window
Plug 'jackson-dean/BufOnly.vim' " Delete all hidden buffers leaving only the currently active
Plug 'majutsushi/tagbar' " Toggle file structure diagrams using ctags
Plug 'tpope/vim-commentary' " Kill buffer without killing the split/window
Plug 'tpope/vim-surround' " Plugin for working with quotes/braces/brackets etc
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

" For work
Plug 'git://gitli.corp.linkedin.com/jcdean/vim-pemberly.git'

" Status Bar
Plug 'vim-airline/vim-airline' " Fancy statusbar
Plug 'vim-airline/vim-airline-themes' " Themes for fancy statusbar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_x = '%{hostname()}'
let g:airline_theme='atomic'
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
let g:indentLine_fileTypeExclude = ['json']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_char = '┊'

" Color themes
Plug 'chriskempson/base16-vim'

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
au BufWritePre * %s/\s\+$//e
" source vimrc after writing to it
au BufWritePost $MYVIMRC source $MYVIMRC

" Personal key remapping
let mapleader=","
" More convenient exiting insert mode
inoremap jj <Esc>
" More convenient split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Keep last visual selection after shifting blocks
vnoremap > ><CR>gv
vnoremap < <<CR>gv
" Cycle buffers quickly
map <S-Tab> :bnext<CR>
" Open gf files in vertical split
map gf :vertical wincmd f<CR>
" Quickly search the word under the cursor
vnoremap // y/<C-R>"<CR>"
" Denite mappings
map <silent><C-p> :Denite file_rec/git -reversed<CR>
nnoremap <Leader>a :Denite grep<CR>
" Nerdtree mappings
map <silent><C-n><C-t> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>
map <Leader>rf :PemberlyRelatedFile<CR>
nnoremap <silent> <S-left> :vertical resize -10<CR>
nnoremap <silent> <S-right> :vertical resize +10<CR>
nnoremap <silent> <S-up> :resize +10<CR>
nnoremap <silent> <S-down> :resize -10<CR>
nnoremap <silent> <Leader><CR> o<Esc>
nnoremap <silent> <Leader>c :noh<CR>
nnoremap <silent> <Leader>q :ccl<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>tb :TagbarToggle<CR>
nnoremap <silent> <Leader>m :Denite menu<CR>

" map comment toggle to something like every other editor
" for some weird reason '_' maps to '/'
map <C-_> :Commentary<Esc>
map <C-/> :Commentary<Esc>

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
  " Toggle insert mode
  tnoremap <silent> <Esc> <C-\><C-n>
  " Close and open the terminal
  tnoremap <silent> <C-t> <C-\><C-n>:q<CR>
  nnoremap <silent> <C-t> :Term<CR>
endif

" TODO: move to vim-pemberly plugin?
function! s:FindReferences()
  set isk+=/,-
  DeniteCursorWord grep
  set isk-=/,-
endfunction

" Personal commands
command! RevealInExplorer execute 'NERDTreeFind'
command! FindRefs call s:FindReferences()
command! EditInit vsplit ~/.config/nvim/init.vim
command! -range SendSelectionToRemote execute "<line1>,<line2>w! ".$HOME."/yanked.txt | !scp ~/yanked.txt ".$VIM_REMOTE_USER."@".$VIM_REMOTE_HOST.":~/yanked.txt && ssh ".$VIM_REMOTE_USER."@".$VIM_REMOTE_HOST." 'pbcopy < ~/yanked.txt'"
command! ResetWorkspace Startify | BufOnly
command! ShowSignColumnColor echo synIDattr(hlID("SignColumn"), "bg")
command! ConcealRemove execute 'set conceallevel=0'
command! ColorSchemes Denite colorscheme
command! ListBuffers Denite buffer
command! RecentFiles Denite file_old

" Do custom highlighting at the end so it doesn't get inadvertantly cleared
highlight ALEErrorSign ctermfg=NONE ctermbg=NONE guifg=red guibg=#353b45
highlight ALEWarningSign ctermfg=NONE ctermbg=NONE guifg=yellow guibg=#353b45

" Denie configuration
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<up>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<down>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-z>',
      \ '<denite:toggle_select>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-*>',
      \ '<denite:toggle_select_all>',
      \ 'noremap'
      \)

call denite#custom#source(
      \ 'file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source(
      \ 'file_rec', 'matchers', ['matcher_cpsm'])

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])
call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
call denite#custom#option('_', 'highlight_preview_line', 'CursorLine')
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'Boolean')
call denite#custom#map('insert', '<C-@>', '<denite:toggle_select_up>', 'noremap')
call denite#custom#map('insert', '<C-Space>', '<denite:toggle_select_up>', 'noremap')
call denite#custom#option('default', 'prompt', '>')

" grep source ag setup
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" narrow by path in grep results
call denite#custom#source('grep',
	\ 'converters', ['converter_abbr_word'])

" Add custom menus
let s:menus = {}
let s:menus.Search = {
      \ 'description': 'The silver searcher'
      \ }
let s:menus.Search.command_candidates = [
      \ ['Everywhere', 'Denite grep'],
      \ ['Exclude test files', 'Denite grep::--ignore="*test.js"'],
      \ ['Only hbs files', 'Denite grep::--handlebars'],
      \ ['Only js files', 'Denite grep::--js'],
      \ ['Only js and exclude test files', "Denite grep::\"--js --ignore='*test.js'\""]
      \ ]
let s:menus.Settings = {
      \ 'description': 'Edit vim configuration'
      \ }
let s:menus.Settings.file_candidates = [
      \ ['init.vim', '~/.config/nvim/init.vim'],
      \ ['.vimrc', '~/.vimrc'],
      \ ]
call denite#custom#var('menu', 'menus', s:menus)
