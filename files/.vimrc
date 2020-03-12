" Automatic installation for vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:flutter_hot_reload_on_save = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
Plug 'sheerun/vim-polyglot'

" Editing and Navigation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'

" Themes and Icons
Plug 'mhartington/oceanic-next'


" Flutter Plugins
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

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

" Theme
syntax enable

if (has("termguicolors"))
  set termguicolors
endif

colorscheme OceanicNext

" Tab for Emmet completion, to work only in these FileTypes
" autocmd FileType html,css,typescript,javascript.jsx imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" Only allow Emmet in these FileTypes
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,typescript,javascript.jsx EmmetInstall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Core
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lines
" set number
set relativenumber
set cursorline

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" always show signcolumns
" set signcolumn=yes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Flutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" Elixir format on save
autocmd BufWritePost *.exs,*.ex silent :!mix format %
