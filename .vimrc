" Install vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Set up vim-plugins
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'craigemery/vim-autotag'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'
Plug 'andreyorst/SimpleClangFormat.vim'

call plug#end()

let mapleader=" "
nnoremap <SPACE> <Nop>
nnoremap <leader>w :w<cr>
nnoremap <leader>w <C-c>:w<cr>

set nopaste
set backspace=indent,eol,start
set encoding=utf-8
set background=dark
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=140
set expandtab
set autoindent
set fileformat=unix

" Enable folding with space bar
set foldmethod=manual
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#enabled = 1

nmap <F8> :TagbarToggle<CR>
nmap <c-l> : CtrlPTag<CR>
set hlsearch
syntax on

set tags=./tags,tags;$HOME
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!


"coc.vim settings from git repo suggestions
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("patch-8.1.1564")
"  " Recently vim can merge signcolumn and number column into one
"  set signcolumn=number
"else
"  set signcolumn=yes
"endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>

""" Customize colors for popup menuss
hi Pmenu ctermbg=black ctermfg=white

let g:SimpleClangFormat#options = {
    \ "BasedOnStyle": "webkit",
    \ "IndentWidth": 4,
    \ "TabWidth": 4,
    \ "PointerAlignment": "Left",
    \ "AlignAfterOpenBracket": "DontAlign",
    \ "AlignConsecutiveAssignments": "true",
    \ "AlignConsecutiveDeclarations": "true",
    \ "AlignTrailingComments": "true",
    \ "BreakBeforeBraces": "Stroustrup",
    \ "UseTab": "ForIndentation",
    \ "SortIncludes": "false",
    \}
let g:SimpleClangFormat#useShiftWidth = 1
let g:SimpleClangFormat#useTabStop = 1
