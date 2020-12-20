" Automatic installation for vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===> Plugins
call plug#begin()
Plug 'sheerun/vim-polyglot'

" Editing and Navigation
Plug 'preservim/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin' |
      \ Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'

" Theme
Plug 'haishanh/night-owl.vim'

" Syntax for Firestore Rules
Plug 'delphinus/vim-firestore'

" Support for Elixir
Plug 'slashmili/alchemist.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" Deoplete autocompletion
let g:deoplete#enable_at_startup = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Git Status indicators in NERDTree
let g:NERDTreeGitStatusUseNerdFonts = 1


let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" ===> Theme
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme night-owl

" ===> AutoCmd-s
autocmd VimEnter * NERDTree " run NERDTree on start-u
autocmd VimEnter * wincmd p " focus active window

" Elixir format on save
autocmd BufWritePost *.exs,*.ex silent :!mix format %

" ===> ALE config
let g:ale_sign_error = '●'   " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0  " Less distracting when opening a new file

let g:ale_linters = {
      \  'sh': ['shell'],
      \  'dart': ['language_server'],
      \  'javascript': ['eslint'],
      \  'typescript': ['eslint'],
      \  'typescriptreact': ['eslint']
      \}
let g:ale_fixers = {
      \  'dart': ['dartfmt'],
      \  'sh': ['shfmt'],
      \  'javascript': ['prettier', 'eslint'],
      \  'typescript': ['prettier', 'eslint'],
      \  'typescriptreact': ['prettier', 'eslint'],
      \  'json': ['prettier'],
      \  'markdown': ['prettier'],
      \  'yaml': ['prettier'],
      \  'css': ['prettier']
      \}
let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_fix_on_save = 1

" ===> VIM Core
let mapleader = ','

" always show signcolumns
set signcolumn=yes

" set number
set relativenumber
set cursorline

" Remove bottom line in favour of vim-airline
set nosmd   " short for 'showmode'
set noru    " short for 'ruler'

" Remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile

" Indentation
set expandtab       " use spaces instead of tabs
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 spaces

" keep the cursor visible within 7 lines when scrolling
set scrolloff=7

" Performance
set synmaxcol=200

" Encoding
set encoding=utf-8

" ===> Completion
call deoplete#custom#option('sources', {
      \ '_': ['ale'],
      \})

let g:ale_completion_tsserver_autoimport = 1

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c
