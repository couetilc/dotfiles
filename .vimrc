set nocompatible "be iMproved, required for Vundle
set shell=/bin/bash "sane default for vim shell/package manager

" vim-plug stuff (the if block installs vim-plug if it isn't already, see
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive' "git client
Plug 'scrooloose/nerdtree' "file system explorer
Plug 'tpope/vim-surround' "modify surrounding characters easily
Plug 'w0rp/ale' "asynchronous linter
Plug 'airblade/vim-gitgutter' "shows git diff in sign column
Plug 'vim-airline/vim-airline' "lightweight status bar at bottom (smaller version is called lightline)
Plug 'vim-airline/vim-airline-themes' "themes for status bar
Plug 'tpope/vim-commentary' "simple commenting for vim
Plug 'sainnhe/sonokai' " colorscheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' } "colorscheme
" Plug 'ms-jpq/coq_nvim' " autocompletion (ctrl-space for one)
Plug 'EdenEast/nightfox.nvim' " colorscheme (nightfox, nordfox, palefox) 
Plug 'Pocco81/Catppuccino.nvim' " colorscheme (catppucino, neon_latte, light_melya)
Plug 'sheerun/vim-polyglot' " syntax highlighting and indentation for many languages

if has('nvim')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' "https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/playground' "try with TSPlaygroundToggle
Plug 'ishan9299/nvim-solarized-lua'
Plug 'editorconfig/editorconfig-vim' "for project-specific settings
Plug 'ishan9299/modus-theme-vim'
endif

call plug#end()

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

""" COLORSCHEMES """

" Sonokai (https://github.com/sainnhe/sonokai)
" This is a nice colorscheme, but cursor color is rather opaque, hiding
" characters)
colorscheme sonokai

" Modus Themes (High-contrast emacs theme -
" https://protesilaos.com/emacs/modus-themes)
" colorscheme modus-vivendi " Dark
" colorscheme modus-operandi " Light

let g:airline_theme="sol"

if has('gui_running')
  set background=light
else
  set background=dark
endif

"Allows for scrolling in vim page
"if has('mouse')
"  set mouse=a
"endif

set tabstop=2 "visual width
set softtabstop=2 " number of spaces Tab inserts
set shiftwidth=2 " insert 2 spaces when shifting indentation
set expandtab "replace tabs with spaces
set eol "automatic newline at end of file

set number "show line numbers
set ruler "show line and column of cursor
set showmatch "highlight matching brackets
set scrolloff=5 "line padding between cursor and window edge
set laststatus=2 "always show status line (0: never, 1: only if 2 or more windows)
"set cursorline "highlights current line of cursor
"set list " show hidden characters
"set listchars=tab:▸\ ,eol:¬ " set what symbols represent hidden characters

set wildmenu "vim command autocomplete
set wildmode=list:longest "show all possible partial command completions
set history=1000 "vim command history size

set incsearch "search while typing query
set hlsearch "highlight all query matches
set ignorecase "when used with smartcase
set smartcase "ignore case unless capital is present

set ttyfast
set hidden "allows buffers to be pushed to background instead of closed, access using :ls then :b[#]. Close buffer with :bd
set autoread "reload files when modified
set autowrite "automatically save before commands like :next and :make
set backupcopy=yes "change how vim writes changes to files

set colorcolumn=80 "one more than PEP8 max line size
set backspace=indent,eol,start "allow backspacing over items
set autoindent
set smartindent
set visualbell "no bell sounds

set showcmd "show (partial) command in status line

"makes the git gutter sign column background color match the the line number
"column's background color (otherwise is a weird grey)
highlight! link SignColumn LineNr

""""Personal Key Mappings

"jump around
nmap <C-j> jj
nmap <C-k> kk

" delete whitespace at end-of-line (the :let removes the search from @/, the last used search register)
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" open up a new window with vimrc inside
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" hide all margin helpers/tools to easily copy text
nnoremap <leader>nn :set number!<cr>:GitGutterToggle<cr>:ALEToggle<cr>

""""

"For saving and loading folds upon exit/enter
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

"Setting syntaxes
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

"""Personal Key Mappings
nmap <C-j> jj
nmap <C-k> kk

"easy switch between splits with Ctrl-h,j,k,l
"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l

"set foldenable " Turn on folding
"set foldmarker={,} " Fold C style code
"set foldmethod=marker " Fold on the marker
"set foldlevel=100 " Don't autofold anything (but I can still fold manually)
"set foldopen-=search " don't open folds when you search into them
"set foldopen-=undo " don't open folds when you undo stuff

"Plugin Settings: editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] "let's the plugin work well with fugitive plguin
au FileType gitcommit let b:EditorConfig_disable = 1 " disable for git commit message filetype

"Plugin Settings: NERDTree
"toggle NERDTree with CTRL-N
nmap <silent> <C-N> :NERDTreeToggle<CR>

"Plugin Settings: ALE
" Configure ale to use eslint for javascript files
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let b:ale_linters = {'javascript': ['eslint'], 'jsx': ['eslint']}
" Configure what fixers run after linting
let b:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'css': ['prettier'],
\ 'scss': ['prettier'],
\ 'markdown': ['prettier'],
\ 'python': [],
\}
" Set this variable to 1 to fix files when you save them.
"let g:ale_fix_on_save = 1

" Make messages prettier
"let g:ale_sign_error = 'X' " could use emoji
"let g:ale_sign_warning = '?' " could use emoji
"let g:ale_status_line_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
"let g:ale_echo_msg_format = '%linter% says %s'

" For Linting only after saving see 
"   Write this in your vimrc file
"let g:ale_lint_on_text_changed = 'never'
"   You can disable this option too
"   if you don't want linters to run on opening a file
"let g:ale_lint_on_enter = 0

"configure code completion
let g:ale_completion_enabled=0
"set completeopt=menuone,noinsert,noselect,preview " for ale completion, if enabled
set completeopt=menu,preview
"let g:ale_completion_delay=
"let g:ale_completion_max_suggestions=

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

syntax off

if has('nvim')

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = false,
    },
    ensure_installed = 'maintained'
}
EOF

endif
