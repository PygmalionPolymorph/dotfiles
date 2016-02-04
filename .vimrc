set nocompatible              " be iMproved, required
filetype off                  " required
syntax off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Open Files with fuzzy search
Plugin 'kien/ctrlp.vim'
" Configurable context sensitive Statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" PluginCollection for python developement
Plugin 'klen/python-mode'
" Outine variable and functions
Plugin 'taglist.vim'
" Insane git integration
Plugin 'tpope/vim-fugitive'
" Browse files on your system
Plugin 'scrooloose/nerdtree'
" Work with 'surroundings'
Plugin 'tpope/vim-surround'
" Repeat functions provided by plugins
Plugin 'tpope/vim-repeat'
" Snippets
Plugin 'SirVer/ultisnips'
" Code Snippets for HTML
Plugin 'mattn/emmet-vim'
" HTML5 Syntax
Plugin 'othree/html5.vim'
" CSS3 Syntax
Plugin 'hail2u/vim-css3-syntax'
" Stylus Syntax Highlighting
Plugin 'wavded/vim-stylus'
" Snippets for Ultisnips
Plugin 'honza/vim-snippets'
" Javascript Syntax
Plugin 'othree/yajs.vim'
" Javascript Libraries Syntax
Plugin 'othree/javascript-libraries-syntax.vim'
" Nerdtree Git Flags
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Python Unit Testing with py.test
Plugin 'alfredodeza/pytest.vim'

" ColorSchemes
Plugin 'sickill/vim-monokai'
Plugin 'baskerville/bubblegum'

call vundle#end()
filetype plugin indent on


" Configure Airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'bubblegum'
autocmd! bufwritepost .vimrc source %

set clipboard=unnamed
set bs=2

let mapleader=","

"Movement
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
noremap   <C-E> 3<C-Y>
noremap   <C-Y> 3<C-E>
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

map <c-j> <c-w>j
map <c-h> <c-w>h
map <c-k> <c-w>k
map <c-l> <c-w>l
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>s :sort<CR>

vnoremap < <gv
vnoremap > >gv

"Syntax Highlighting & Colors
syntax on

"Mark Unneccessary Whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
set t_Co=256
color molokai

set laststatus=2
"Line numbers
set number
set relativenumber
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=16

"History and Backup
set history=700
set undolevels=700
set nobackup
set nowritebackup
set noswapfile

"Tabs and Spaces
set tabstop=8
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

"Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"Splits
set splitbelow
set splitright
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

set wildignore+=node_modules
set ruler

"Emmet
let g:user_emmet_leader_key='<tab>'

"Language-Specific: Javascript
let g:used_javascript_libs= 'angularjs,angularui,jquery,underscore'

"Folding
set nofoldenable

"Language-Specific: Python
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin="tabnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace()
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-v>"

" Taglist
map <Leader><tab> :TlistToggle<CR>

" Statusline
"set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

