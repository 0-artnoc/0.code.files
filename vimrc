" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set fileencoding=utf-8
set nocompatible
filetype off

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" setup Vundle begin """"""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/syntastic'
Plugin 'townk/vim-autoclose'
Plugin 'easymotion/vim-easymotion'
Plugin 'leafgarland/typescript-vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'valloric/youcompleteme'
Plugin 'dracula/vim'

call vundle#end()
syntax enable
filetype plugin indent on
" setup Vundle end """""""""""""""""""""""""

imap jj <Esc>

" NERDTree
map <C-b> :NERDTreeToggle<CR>

" easymotion
let g:EasyMotion_do_mapping=0
let g:EasyMotion_smartcase=1
nmap <Leader>f <Plug>(easymotion-overwin-f)

" emmet
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall

" YCM
let g:ycm_python_binary_path='/usr/local/bin/python3'
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_auto_trigger=0

" setup ctrlp
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vscode'

" tagbar
nmap <F8> :TagbarToggle<CR>

" typescript
let g:typescript_indent_disable=1
let g:typescript_compiler_binary='tsc'
let g:typescript_compiler_options=''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost l* nested lwindow

" python run current file output in split buffer
command! Pr new | 0read !python3 #:t
" node run current file output in split buffer
command! Nr new | 0read !node #:t

" golang
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gi <Plug>(go-info)
au FileType go nmap <leader>gd <Plug>(go-def-vertical)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['gofmt', 'vet', 'golint']
let g:go_metalinter_deadline = "5s"

" setup airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_powerline_fonts=1
let g:airline_theme='papercolor'
let g:airline_section_c='%t%m'
let g:airline_section_z=''
let g:airline_section_y=''
let g:airline_detect_modified=1
let g:airline_skip_empty_sections=1

nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

" use jshint//syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint', 'tsc']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_post_args="--max-line-length=120"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_highlighting=0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height=3

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

color dracula
syntax on
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

"complete
set complete-=i

" Use Unix as the standard file type
set ffs=unix,dos,mac
set number
set relativenumber
set numberwidth=4

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab
set cindent
set smartindent
set showcmd

" remove quickfix list from buffer next/previous
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" resize windows
nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off 
set nobackup
set nowb
set noswapfile

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline

" Set 4 lines to the cursor - when moving vertically using j/k
set so=4

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" no word wrap
set nowrap

" move lines up and down
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" handle { } brackets
inoremap { {<Space>}<Left>
inoremap {<CR> {<CR>}<Esc>O

" turn off search highlighting
nnoremap <CR> :noh<CR><CR>

set noerrorbells
set novisualbell
set timeoutlen=250
