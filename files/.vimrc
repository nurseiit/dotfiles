" Automatic installation for vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
" Plug 'wakatime/vim-wakatime'
Plug 'pangloss/vim-javascript' " dependency for 'mxw/vim-jsx'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'         " quick web/dev complete
call plug#end()

" NOVA-VIM
colorscheme nova

" run NERDTree on start-up and focus active window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Tab for Emmet completion, to work only in these FileTypes
autocmd FileType html,css,typescript,javascript.jsx imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" Only allow Emmet in these FileTypes
let g:user_emmet_install_global = 0
autocmd FileType html,css,typescript,javascript.jsx EmmetInstall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_error = '●'   " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0  " Less distracting when opening a new file

let g:ale_fix_on_save = 1
let g:ale_linters = {
\  'sh': ['shell'],
\  'javascript': ['eslint'],
\}
let g:ale_fixers = {
\  'sh': ['shfmt'],
\  'javascript': ['prettier', 'eslint'],
\  'json': ['prettier'],
\  'markdown': ['prettier'],
\  'yaml': ['prettier'],
\  'css': ['prettier'],
\}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Core
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lines
set number
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

" set Adobe's Source Code Pro font as default
set guifont=Source\ Code\ Pro

" Use <C-Space> for Vim's keyword autocomplete
" ..in terminal
inoremap <Nul> <C-n>
" ..in gui mode
inoremap <C-Space> <C-n>

" Performance
set synmaxcol=200
