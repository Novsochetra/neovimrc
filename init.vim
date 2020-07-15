set termguicolors
filetype plugin indent on
syntax on
set guifont=Operator\ Mono\ Book\ Italic:h1
set mouse=a
set tabstop=2
set shiftwidth=2
set expandtab
set number
set noswapfile
set relativenumber
set encoding=utf8

"Short Cut"
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'mhinz/vim-signify'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

" Plugin for fluter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

" Icons
Plug 'ryanoasis/vim-devicons'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'jiangmiao/auto-pairs'

" Lint Plugin
Plug 'dense-analysis/ale'


if has('nvim')
  " Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

"Autoload the current file directory with NERDTree"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" * * * DENITE CONFIGURATION * * *  "

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
" nmap ; :Denite buffer<CR>
" nmap <leader>t :DeniteProjectDir file/rec<CR>
" nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
" nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
" autocmd FileType denite-filter call s:denite_filter_my_settings()
" function! s:denite_filter_my_settings() abort
"   imap <silent><buffer> <C-o>
"   \ <Plug>(denite_filter_quit)
"   inoremap <silent><buffer><expr> <Esc>
"   \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> <Esc>
"   \ denite#do_map('quit')
"   inoremap <silent><buffer><expr> <CR>
"   \ denite#do_map('do_action')
"   inoremap <silent><buffer><expr> <C-t>
"   \ denite#do_map('do_action', 'tabopen')
"   inoremap <silent><buffer><expr> <C-v>
"   \ denite#do_map('do_action', 'vsplit')
"   inoremap <silent><buffer><expr> <C-h>
"   \ denite#do_map('do_action', 'split')
" endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
"
" autocmd FileType denite call s:denite_my_settings()
" function! s:denite_my_settings() abort
"   nnoremap <silent><buffer><expr> <CR>
"   \ denite#do_map('do_action')
"   nnoremap <silent><buffer><expr> q
"   \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> <Esc>
"   \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> d
"   \ denite#do_map('do_action', 'delete')
"   nnoremap <silent><buffer><expr> p
"   \ denite#do_map('do_action', 'preview')
"   nnoremap <silent><buffer><expr> i
"   \ denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <C-o>
"   \ denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <C-t>
"   \ denite#do_map('do_action', 'tabopen')
"   nnoremap <silent><buffer><expr> <C-v>
"   \ denite#do_map('do_action', 'vsplit')
"   nnoremap <silent><buffer><expr> <C-h>
"   \ denite#do_map('do_action', 'split')
" endfunction

" * * * END DENITE CONFIGURATION * * *  "


" * * * NERDTree CONFIGURATION * * *  "
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
" * * * END NERDTree CONFIGURATION * * *  "

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Select Snippet detial: https://github.com/neoclide/coc-snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" fzf map key
nmap <leader>t :Files .<Enter>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" loading the plugin icon
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

" set up prettier to format on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Flutter Config key
nnoremap <leader>fr :FlutterHotRestart<cr>

" Flutter Widget Wrap
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Delete Selected Widget
nmap df <leader>aw13<Enter>

colorscheme gruvbox
