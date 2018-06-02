" Configuration file for vim
set modelines=0		" CVE-2007-2438
set autoindent
syntax on

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
syntax on
set nu
"set cindent
set background=dark
set ruler
set history=1000
set shiftwidth=4 softtabstop=4 expandtab
colorscheme elflord
set showcmd
set autoindent
set nobackup
set noswapfile
set hlsearch
set incsearch

" Auto-completation special characters.
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
filetype plugin on
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
filetype off                  " required

"""""""" VIEW SETTINGS """"""""
autocmd InsertLeave * se nocul " high-lighted current line
set ruler
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}"")}
set laststatus=2
set foldenable
set magic

""""""""""""""""""""""""" VUNDLE SETTINGS BEGIN """"""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'L9'
Plugin 'The-NERD-tree'
Plugin 'Syntastic'
Plugin 'FuzzyFinder'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Tagbar' 
Plugin 'rdnetto/YCM-Generator' 
Plugin 'kien/ctrlp.vim' 

" Python auto-completation"
Plugin 'davidhalter/jedi'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

filetype plugin indent on    " required
call vundle#end()            " required
""""""""""""""""""""""""""" VUNDLE SETTINGS END """""""""""""""""""""""""""

" Enable folding with the spacebar
nnoremap <space> za

au BufNewFile, BufRead *.py
            \ set tabstop=4
            \ set softtabstop=4
            \ set shiftwidth=4
            \ set textwidth=4
            \ set expandtab
            \ set autoindent
            \ set fileformat=unix

au BufNewFile, BufRead *.js, *.html, *.css 
            \ set tabstop=2
            \ set softtabstop=2
            \ set shiftwidth=2

au BufRead, BufNewFile *.py *.pyw, *.c, *.h match BadWhitespace /\s\+&/

set encoding=utf-8
let python_highlight_all=1
syntax on

set t_Co=256
set mouse=a
set expandtab
filetype indent on

" taglist setting"
let Tlist_Compact_Format=1
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Auto_Highlight_tag=1
let Tlist_Auto_Update=1
let Tlist_WinWidth=30
let Tlist_Exit_OnlyWindow=1

let Tlist_Use_SingClick=1
nnoremap <silent> <F8> :TlistToggle<CR>


" NERD_Tree settings"

"""""""""""""""""""""""""""" YCM SETTINGS BEGIN """"""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let mapleader=","
nnoremap <leader>u :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>i :YcmCompleter GoToDefinition<CR>
nnoremap <leader>o :YcmCompleter GoToInclude<CR>

""""""""""""""""""""""""""""  YCM SETTINGS END  """"""""""""""""""""""""""""

"""""""""""""""""""""""""""" NERDTree SETTINGS START """"""""""""""""""""""""""""
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree automatically when vim starts up on opening a directory.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Change default arrows.
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"""""""""""""""""""""""""""" NERDTree SETTINGS END   """"""""""""""""""""""""""""

