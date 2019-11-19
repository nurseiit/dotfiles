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
call plug#end()

" NOVA-VIM
colorscheme nova

" run NERDTree on start-up and focus active window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

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

" Encoding
set encoding=utf-8
