set nocompatible " Disable legacy vi compatiblity

" Start: Vundle Package Manager Settings
filetype off " required for Vundle (I don't know why)
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Utility Packages
Plugin 'MarcWeber/vim-addon-mw-utils' " Snipmate dependency
Plugin 'SirVer/ultisnips' " Snippet manager
Plugin 'Valloric/ListToggle' " Quickly toggle Quickfix and Location panels
Plugin 'Yggdroot/indentLine' " Indent guide lines
Plugin 'airblade/vim-gitgutter' " Show git edit annotations in the gutter
Plugin 'cakebaker/scss-syntax.vim' " Sass/Scss syntax enhancements
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy filename matcher
Plugin 'easymotion/vim-easymotion' " Make moving even easier
Plugin 'elzr/vim-json' " JSON syntax enhancments for vim
Plugin 'ervandew/supertab' " Tab autocompletion
Plugin 'gmarik/Vundle.vim' " Package manager
Plugin 'heavenshell/vim-jsdoc' " Easy doc blocks for js
Plugin 'honza/vim-snippets' " Collection of snippets
Plugin 'jiangmiao/auto-pairs' " Automatically insert pairs of quotes/braces/brackets while typing
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'majutsushi/tagbar' " Toggle file structure diagrams using ctags
Plugin 'mhinz/vim-startify' " Fancy start screen showing recently edited files
Plugin 'mileszs/ack.vim' " Vim ack/ag integration
Plugin 'mxw/vim-jsx' " React/jsx support
Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing/unnecessary whitespace
Plugin 'othree/html5.vim' " HTML5 syntax enhancements
Plugin 'pangloss/vim-javascript' " Better es6/es2015 syntax support
Plugin 'qpkorr/vim-bufkill' " Kill buffer without killing the split/window
Plugin 'ryanoasis/vim-devicons' " Filetype icon support
Plugin 'scrooloose/nerdcommenter' " Quickly toggle comment blocks
Plugin 'scrooloose/nerdtree' " File explorer
Plugin 'scrooloose/syntastic' " Linter
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " Colored nerdtree icons
Plugin 'tomtom/tlib_vim' " Snipmate dependency
Plugin 'tpope/vim-fugitive' " Git integration for vim
Plugin 'tpope/vim-surround' " Plugin for working with quotes/braces/brackets etc
Plugin 'tyok/nerdtree-ack' " Search in folder
Plugin 'vim-airline/vim-airline' " Fancy statusbar
Plugin 'vim-airline/vim-airline-themes' " Themes for fancy statusbar
Plugin 'vim-scripts/BufOnly.vim' " Delete all hidden buffers leaving only the currently active
Plugin 'tacahiroy/ctrlp-funky' " List functions in current file without ctags
Plugin 'prettier/vim-prettier' " Formate javasript
Plugin 'junegunn/fzf'

" colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'dikiaap/minimalist'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-vividchalk'
Plugin 'crusoexia/vim-monokai'
Plugin 'rafi/awesome-vim-colorschemes'

" For work
Plugin 'git://gitli.corp.linkedin.com/jcdean/vim-pemberly.git'

call vundle#end()
" End: Vundle Package Manager Settings

filetype plugin indent on " Allow smart indentation and filetype detection
set encoding=utf8 " Set charset to utf8 (Necessary for fancy icon plugins)
syntax enable " Turn on syntax highlighting
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
set colorcolumn=80 " Vertical rule at 100 columns

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
set wildignore+=*/bower_components/*,*/.git/*,*/concat-stats-for/* " What to ignore for filename completion suggestions

" Make cursor skinny on insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Force .src files to use xml syntax
au BufNewFile,BufRead *.src setlocal ft=xml
au BufNewFile,BufRead *.pdsc setlocal ft=json

set termguicolors
" colorscheme solarized-high-contrast
colorscheme base16-onedark

" strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" source vimrc after writing to it
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Personal key remapping
let mapleader=","
map <C-p> :CtrlP<CR>
map <C-n><C-t> :NERDTreeToggle<CR>
map <Leader>p "0p
map <Leader>ft :Prettier<CR>
map <Leader>fu :CtrlPFunky<CR>
map <Leader>rf :PemberlyRelatedFile<CR>
map <S-Tab> :bnext<CR>
map gf :vertical wincmd f<CR>
nnoremap <silent> <S-left> :vertical resize -10<CR>
nnoremap <silent> <S-right> :vertical resize +10<CR>
nnoremap <silent> <S-up> :resize +10<CR>
nnoremap <silent> <S-down> :resize -10<CR>
nnoremap <silent> <Leader><CR> o<Esc>
nnoremap <silent> <Leader>w :w!<CR>
nnoremap <silent> <Leader>wq :wq!<CR>
nnoremap <silenT> <Leader>wa :wa!<CR>
nnoremap <silent> <Leader>c :noh<CR>
inoremap jj <Esc>
vnoremap // y/<C-R>"<CR>"
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>ra :Ack!<Space>'<C-R>"' core extended lib engine-lib --ignore='*test.js'
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <Leader>nf :NERDTreeFind<CR>
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Personal commands
command! DiffOn execute 'windo diffthis'
command! DiffOff execute "diffoff!"
command! Vrc execute "vsplit ".$MYVIMRC
command! Gdmaster execute "Gvsplit master:%"

" vmustache/vim-mustache-handlebars settings
let g:mustache_abbreviations = 1

" scrooloose/nerdtree settings
let NERDTreeMouseMode = 2
"let NERDTreeRespectWildIgnore = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore=[
      \'^\.gradle$',
      \'^\.log$',
      \'^logs$',
      \'^i18n$',
      \'^node_modules$',
      \'^dist$',
      \'^tmp$',
      \'^bower_components$',
      \'^coverage$',
      \'^build$',
      \'^acl$',
      \'^screenshots$',
      \'^tools$',
      \'^vendor$',
      \'^docs$',
      \'^out$',
      \'^concat-stats-for$']

" scrooloose/nerdcommenter
let NERDSpaceDelims=1

" scrooloose/syntastic settings
let SignColumnBGC = synIDattr(hlID("SignColumn"), "bg")
exe 'highlight SyntasticErrorSign guifg=red guibg='.SignColumnBGC
let g:syntastic_javascript_eslint_exec = '$PWD/node_modules/.bin/eslint'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '✖'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

" ctrlpvim/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Respect .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme='base16'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Refresh vim-airline after sourcing vimrc
if exists('g:loaded_airline')
  AirlineRefresh
endif

" mhinz/vim-startify
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

" mileszs/ack.vim
let g:ackhighlight = 1
if executable('ag')
  " Use ag (the silver searcher) if it's installed
  let g:ackprg = 'ag --vimgrep'
endif

" Valloric/ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" elzr/vim-json
let g:vim_json_syntax_conceal = 0

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 0

" heavenshell/vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_underscore_private = 1

" Yggdroot/indentLine
let g:indentLine_char = '┊'
let g:indentLine_enabled = 1

" airblade/vim-gitgutter settings
set signcolumn=yes
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✎'
let g:gitgutter_sign_removed = '－'
let g:gitgutter_sign_removed_first_line = '－'
let g:gitgutter_sign_modified_removed = '✎'

" ryanoasis/vim-devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" tiagofumo/vim-nerdtree-syntax-highlight
let s:yellow = "F2DD58"
let s:green = "8FAA54"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['js'] = s:yellow " make js a brighter yellow
let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['json'] = s:green " make json green
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid  error
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" SirVer/ultisips
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips" " personal snippets directory
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
