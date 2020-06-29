call plug#begin("~/.vim/plugged")
  " Theme 
  Plug 'dracula/vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'morhetz/gruvbox'
  Plug 'tomtom/tcomment_vim'
  Plug 'preservim/nerdcommenter' 
  Plug 'Xuyuanp/nerdtree-git-plugin'   " show git status in file tree view
  Plug 'itchyny/lightline.vim'         " better look of vim status line
  Plug 'ap/vim-buftabline'             " buffers to tabline, shows buffers as tabs on top of window
  Plug 'tomasr/molokai'                " sublime theme
  Plug 'dunstontc/vim-vscode-theme'          " vscode theme
  Plug 'equalsraf/neovim-gui-shim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'Soares/base16.nvim'
  Plug 'chriskempson/base16-vim'			 " File Explorer with Icons
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
 " Plug 'vim-airline/vim-airline'
 " Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-scripts/grep.vim'
  Plug 'vim-scripts/CSApprox'
  Plug 'Raimondi/delimitMate'
  Plug 'majutsushi/tagbar'
  Plug 'w0rp/ale'
  Plug 'Yggdroot/indentLine'
  Plug 'avelino/vim-bootstrap-updater'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
  "" Vim-Session
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'

  "" Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  "" Color
  Plug 'tomasr/molokai'

  "*****************************************************************************
  "" Custom bundles
  "*****************************************************************************

  " html
  "" HTML Bundle
  Plug 'hail2u/vim-css3-syntax'
  Plug 'gorodinskiy/vim-coloresque'
  Plug 'tpope/vim-haml'
  Plug 'mattn/emmet-vim'


  " javascript
  "" Javascript Bundle
  Plug 'jelera/vim-javascript-syntax'


  " php
  "" PHP Bundle
  Plug 'arnaud-lb/vim-php-namespace'


  " python
  "" Python Bundle
  Plug 'davidhalter/jedi-vim'
  Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


  " vuejs
  Plug 'posva/vim-vue'
  Plug 'leafOfTree/vim-vue-plugin'


  Plug 'mengelbrecht/lightline-bufferline'

  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/fzf.vim'
  Plug 'ervandew/supertab'
  Plug 'sonph/onehalf'
  Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Enable theming support
if (has("termguicolors"))
 set termguicolors

endif

let mapleader = ","

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2

" let base16colorspace=256

set hidden

let g:vim_vue_plugin_load_full_syntax = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" switch buffers
nnoremap <A-2> :bnext<CR>
nnoremap <A-1> :bprev<CR>
" close buffers
nnoremap <leader>q :bd<CR> 

" search text in files
nmap <C-F> :Ag

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall
let g:user_emmet_mode='a'
let g:user_emmet_leader_key=','
let g:tagalong_verbose = 1
imap <expr> <C-Space> emmet#expandAbbrIntelligent("\<tab>")


let g:ackprg = 'ag --nogroup --nocolor --column'

set number
set cursorline  
set showmatch

" Theme
syntax enable

colorscheme base16-tomorrow-night
hi MatchParen cterm=none ctermbg=green ctermfg=blue
autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=red ctermbg=yellow
"
" base16-gruvbox-light-hard
" gruvbox-light-hard  material  woodland  chalk cupertino  irblack  tomorrow-night

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <leader>b :NERDTreeToggle<CR>
let NERDTreeChDirMode=0



" Search selected text
vnoremap // y/<C-R>=escape(@",'/\')<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" :All<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" open new split panes to right and below
set splitright
set splitbelow
set encoding=UTF-8
set guifont=Monospace\ 11
set scrolloff=3
set mouse=a
" set textwidth=80
let g:airline_powerline_fonts = 1


" use <C-Space> for Vim's keyword autocomplete
""  ...in the terminal
" inoremap <Nul> <C-n>
"  ...and in gui mode
" inoremap <C-Space> <C-n>

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

highlight StatusLineNC cterm=bold ctermfg=white ctermbg=black

" color of selected code
hi Visual term=reverse cterm=reverse guibg=#000000

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l><C-w>l

" Remember fold
"
augroup remember_folds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent! loadview
augroup END

" set foldmethod=manual
" set foldlevelstart=1

" let javaScript_fold=1         " JavaScript
" let perl_fold=1               " Perl
" let php_folding=1             " PHP
" let r_syntax_folding=1        " R
" let ruby_fold=1               " Ruby
" let sh_fold_enabled=1         " sh
" let vimsyn_folding='af'       " Vim script
" let xml_syntax_folding=1      " XML

" Indent PHP
"
" map <c-f> :set foldmethod=indent<cr>zM<cr>
" map <c-F> :set foldmethod=manual<cr>zR<cr>

" for command mode
" nnoremap <S-Tab> <<
" for insert mode
" inoremap <S-Tab> <C-d>


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

hi CursorLine   cterm=NONE ctermbg=254 ctermfg=NONE guibg=#000620
hi Folded guibg=#091109 guifg=white

nmap <leader>/ <Plug>(choosewin)
nmap <leader><right><right> :set splitright<cr> :vsplit<cr>
nmap <leader><down><down> :set splitbelow<cr> :split<cr>
nmap <leader><left><left> :set splitright&<cr> :vsplit<cr> :set splitright<cr>
nmap <leader><up><up> :set splitbelow&<cr> :split<cr> :set splitbelow<cr>




"if exists("*fugitive#statusline")
""  set statusline+=%{fugitive#statusline()}
"endif

" vim-airline
"let g:airline_theme = 'powerlineish'
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline_skip_empty_sections = 1


" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules vendor'


" SHORTCUTS 
"
nnoremap <leader><CR> :noh<CR>
nnoremap <leader>w :w<CR>
nnoremap ]t vatatv
nnoremap [t vatatov


inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>

" GOTO specific jump
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

nmap <Leader>j :call GotoJump()<CR>

"
"
"
"
"
"
"

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END



" vuejs
" vim vue
let g:vue_disable_pre_processors=1
" vim vue plugin
let g:vim_vue_plugin_load_full_syntax = 1


"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
" if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif

"if !exists('g:airline_powerline_fonts')
"  let g:airline#extensions#tabline#left_sep = ' '
"  let g:airline#extensions#tabline#left_alt_sep = '|'
"  let g:airline_left_sep          = '▶'
"  let g:airline_left_alt_sep      = '»'
"  let g:airline_right_sep         = '◀'
"  let g:airline_right_alt_sep     = '«'
"  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
"  let g:airline#extensions#readonly#symbol   = '⊘'
"  let g:airline#extensions#linecolumn#prefix = '¶'
"  let g:airline#extensions#paste#symbol      = 'ρ'
"  let g:airline_symbols.linenr    = '␊'
"  let g:airline_symbols.branch    = '⎇'
"  let g:airline_symbols.paste     = 'ρ'
"  let g:airline_symbols.paste     = 'Þ'
"  let g:airline_symbols.paste     = '∥'
"  let g:airline_symbols.whitespace = 'Ξ'
"else
"  let g:airline#extensions#tabline#left_sep = ''
""  let g:airline#extensions#tabline#left_alt_sep = ''
"
  " powerline symbols
""  let g:airline_left_sep = ''
""  let g:airline_left_alt_sep = ''
""  let g:airline_right_sep = ''
""  let g:airline_right_alt_sep = ''
""  let g:airline_symbols.branch = ''
""  let g:airline_symbols.readonly = ''
""  let g:airline_symbols.linenr = ''
"endif


command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules,vendor,.git}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))

let $FZF_DEFAULT_COMMAND= 'ag -g ""'
