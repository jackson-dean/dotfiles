set nocompatible " Disable legacy vi compatiblity

" Start: Vundle Package Manager Settings
filetype off " required for Vundle (I don't know why)
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Utility Packages
Plugin 'gmarik/Vundle.vim' " Package manager
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy filename matcher
Plugin 'othree/html5.vim' " HTML5 syntax enhancements
Plugin 'scrooloose/nerdcommenter' " Quickly toggle comment blocks
Plugin 'scrooloose/nerdtree' " File explorer
Plugin 'MarcWeber/vim-addon-mw-utils' " Snipmate dependency
Plugin 'tomtom/tlib_vim' " Snipmate dependency
Plugin 'garbas/vim-snipmate' " Snippet manager
Plugin 'scrooloose/syntastic' " Linter
Plugin 'mustache/vim-mustache-handlebars' " Handlebars syntax enhancements
Plugin 'cakebaker/scss-syntax.vim' " Sass/Scss syntax enhancements
Plugin 'tpope/vim-fugitive' " Git integration for vim
Plugin 'airblade/vim-gitgutter' " Show git edit annotations in the gutter
Plugin 'elzr/vim-json' " JSON syntax enhancments for vim
Plugin 'vim-airline/vim-airline' " Fancy statusbar
Plugin 'vim-airline/vim-airline-themes' " Themes for fancy statusbar
Plugin 'tpope/vim-surround' " Plugin for working with quotes/braces/brackets etc
Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing/unnecessary whitespace
Plugin 'mileszs/ack.vim' " Vim ack/ag integration
Plugin 'pangloss/vim-javascript' " Better es6/es2015 syntax support
Plugin 'mhinz/vim-startify' " Fancy start screen showing recently edited files
Plugin 'jiangmiao/auto-pairs' " Automatically insert pairs of quotes/braces/brackets while typing
Plugin 'qpkorr/vim-bufkill' " Kill buffer without killing the split/window
Plugin 'vim-scripts/BufOnly.vim' " Delete all hidden buffers leaving only the currently active
Plugin 'ervandew/supertab' " Tab autocompletion
Plugin 'Valloric/ListToggle' " Quickly toggle Quickfix and Location panels
Plugin 'majutsushi/tagbar' " Toggle file structure diagrams using ctags
" Plugin 'ternjs/tern_for_vim' " Javascript inference engine - dependency for tagbar
Plugin 'heavenshell/vim-jsdoc' " Generate js doc blocks
Plugin 'Yggdroot/indentLine' " Indent guide lines
Plugin 'ryanoasis/vim-devicons' " Filetype icon support
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " Colored nerdtree icons

" Color Themes
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'dikiaap/minimalist'

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
set mouse=a " Turn on the mouse ;)
set fillchars+=vert:\│ " Solid pipe character for window split icon
set cursorline " highlight current line
set cmdheight=2 " Increase command line height
set numberwidth=5 " Gutter width
set autoread " Auto re-read files that have changes outside of vim

" Swap/Backup file settings
set noswapfile " no more weirdo swap files
set nobackup " no more weirdo backup files
set backupdir=~/.backups " Where backups would go if we had them
set dir=~/.swap " Where swap files would go if we had them

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
let g:indentation_depth = 2
let &tabstop=g:indentation_depth " Set tab character width
let &backspace=g:indentation_depth " Make backspace work like a sane person would expect
let &shiftwidth=g:indentation_depth " Set distance to move lines or blocks
let &softtabstop=g:indentation_depth " Set space added by pressing tab key and removed by pressing backspace
set autoindent " keeps indention at current depth for successive lines
set copyindent " copy the previous indentation on autoindenting
set expandtab " Convert tabs to spaces

set wildmenu " Show completion options (filenames, plugin functions, etc) in a traversable menu
set wildignore+=*/node_modules/*,*/bower_components/*,*/.git/* " What to ignore for filename completion suggestions

colorscheme gruvbox " Nice colors

" vim-mustache-handlebars settings
let g:mustache_abbreviations = 1

" nerdtree seetings
let NERDTreeRespectWildIgnore = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore=[
      \'pemberly',
      \'\.gradle$',
      \'\.log$',
      \'logs',
      \'i18n',
      \'node_modules',
      \'dist',
      \'tmp',
      \'bower_components',
      \'coverage',
      \'build',
      \'acl',
      \'screenshots',
      \'tools',
      \'vendor',
      \'docs',
      \'out',
      \'public']

" strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_eslint_exec = "$PWD/node_modules/.bin/eslint"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '❌'
let g:syntastic_warning_symbol = '⚠️️'
let g:syntastic_style_warning_symbol = '⚠️️'

" CtrlP settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/](logs|i18n|node_modules|dist|tmp|bower_components|coverage|build|acl|screenshots)|(\.(swp|ico|git|svn))$'

" airline status bar settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Startify settings
let g:startify_change_to_vcs_root = 1

" Ack settings
let g:ackhighlight = 1
if executable('ag')
  " Use ag (the silver searcher) if it's installed
  let g:ackprg = 'ag --vimgrep'
endif

" ListToggle settings
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" vim-json settings
let g:vim_json_syntax_conceal = 0

" vim-javascript settings
let g:javascript_plugin_jsdoc = 0

" vim-jsdocs settings
let g:jsdoc_enable_es6 = 1
let g:jsdoc_allow_input_prompt = 1

" indentLine settings
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0

""" Start: vim-nerdtree-colors
let s:yellow = "F2DD58"
let s:green = "8FAA54"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['js'] = s:yellow " make js a brighter yellow
let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['json'] = s:green " make json green
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid  error
""" End: vim-nerdtree-colors

" Personal key remapping
let mapleader=","
map <C-p> :CtrlP<CR>
map <C-f> /
map <C-n><C-t> :NERDTreeToggle<CR>
nnoremap <Leader><CR> o<Esc>
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>wq :wq!<CR>
nnoremap <S-Tab> :bnext<CR>
inoremap jj <Esc>
vnoremap // y/<C-R>"<CR>"
nnoremap <Leader>gs :Gstatus<CR><C-w>t<C-w>H
nnoremap <F2> :TagbarToggle<CR>
nnoremap <Leader>a :Ack!<Space>-Q<Space>
nnoremap <Leader>ar :Ack!<Space>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Make cursor skinny on insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
