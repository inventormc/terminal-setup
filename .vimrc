"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""VUNDLE AND PLUGINS """"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'arcticicestudio/nord-vim'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" VIM SETTINGS """"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"turn on syntax highlighting
syntax enable 

" Color theme
set background=dark
colorscheme nord
" colorscheme gruvbox
" colorscheme molokai

" Line Numbering
set number 
set rnu
" Show matching brackets.
set showmatch

" Auto Indent
" set autoindent

" Font
set guifont=Menlo\ for\ Powerline

set nocompatible

" Show Ruler
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"get rid of swap file bs
set noswapfile
set nobackup
set nowb

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Vertical Movement Speed
set so=5

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Auto Indent, Smart Indent, Wrap Line
" set ai 
"  set si 
set wrap 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" PLUGIN CONFIGS"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntastic

" let g:syntastic_check_on_open = 0

" Turn on vim airline and configure it

let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='bubblegum'
set laststatus=2

" NERDTree Open on Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Automatically open NERDTree

if has("gui_macvim")
	" MacVim only stuff
	autocmd vimenter * NERDTree
endif

" Gruvbox Color


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" COMMANDS + OTHER """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast close
nmap <leader>q :q<cr>

" Useful mappings for managing tabs
" map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" nnoremap <C-h> :tabprevious<CR>
" nnoremap <C-l>   :tabnext<CR>
nnoremap <C-Delete> :tabclose<CR>
nnoremap <C-t> :tabnew<CR>

" Buffers
nnoremap <C-h> :bp<CR>
nnoremap <C-l>   :bn<CR>
cnoremap bd bp<bar>vsp<bar>bn<bar>bd 

" Mapping for moving windows
map <leader>wu <C-w>k<cr>
map <leader>wd <C-w>j<cr>

" Mapping for automcompletion
imap <Tab> <C-P>
" Copy paste bewteen sessions
set clipboard=unnamed

filetype plugin indent on
" show existing tab with 4 spaces width
 set tabstop=4
" " when indenting with '>', use 4 spaces width
 set shiftwidth=4
" " On pressing tab, insert 4 spaces
 set expandtab

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_enable_signs = 1
"
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol="⚠"
"let g:syntastic_style_warning_symbol = "⚠"
"let g:syntastic_style_error_symbol = "⚠"
"let g:syntastic_quiet_messages = { "type": "style" }

" nerd tree
" autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" toggle relative/absolute line number
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
nmap <C-c> :NERDTreeToggle<CR>

" set spelllang=en
" set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add

" ultisnips
let g:UltiSnipsExpandTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ['/Users/michaelchau/.vim/UltiSnips/']
let g:UltiSnipsJumpForwardTrigger="<c-b>"

" vimtex
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" spellcheck
" setlocal spell
" set spelllang=en_us
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" nord
:set cursorline
let g:nord_italic_comments = 1

" vim airline

let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'c' : 'C',
      \ 'v' : 'V',
      \ 'V' : 'V',
      \ '^V' : 'V',
      \ 's' : 'S',
      \ 'S' : 'S',
      \ '^S' : 'S',
      \ }
