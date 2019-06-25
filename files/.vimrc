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
Plug 'trevordmiller/nova-vim'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript' " dependency for 'mxw/vim-jsx'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'         " quick web/dev complete

" Flutter Plugins
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" Completion 'https://github.com/neoclide/coc.nvim'
" Should have nodeJS installed
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
\  'dart': ['language_server'],
\  'javascript': ['eslint'],
\}
let g:ale_fixers = {
\  'dart': ['dartfmt'],
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

" Performance
set synmaxcol=200

" Encoding
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Flutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>
