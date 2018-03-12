"----------------------------------------------
" Plugin management
"----------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/echodoc.vim'
Plug 'scrooloose/nerdtree'
Plug 'sebdah/vim-delve'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}      " Go auto completion
Plug 'zchee/deoplete-jedi'                     " Go auto completion
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript'
Plug 'vim-airline/vim-airline'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
"set autowriteall                  " write on :quit
set clipboard=unnamedplus
set completeopt-=preview          " remove the horrendous preview window
set encoding=utf-8
set listchars=tab:\|\ ,trail:▫
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set number                        " show number ruler
set ruler
set formatoptions=tcqronj         " set vims text formatting options
set softtabstop=2
set tabstop=2
set title                         " let vim set the terminal title
set updatetime=100                " redraw the status bar often
"set cmdheight=2
set noshowmode

syntax enable

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

let mapleader = ','

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" ignore files / folders
set wildignore+=*/node_modules/*
" set fzf
set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
noremap <C-p> :Files<cr>

" neomake
call neomake#configure#automake('nw', 750)
let g:neomake_open_list = 2

"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch                     " move to match as you type the search query
set hlsearch                      " disable search result highlighting

if has('nvim')
    set inccommand=split          " enables interactive search and replace
endif

" Clear search highlights
map <leader>c :nohlsearch<cr>

" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"----------------------------------------------
" Navigation
"----------------------------------------------
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Move between buffers with Shift + arrow key...
nnoremap <S-Left> :bprevious<cr>
nnoremap <S-Right> :bnext<cr>

" ... but skip the quickfix when navigating
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

"----------------------------------------------
" Curly brace close
"----------------------------------------------

"auto close {
function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\|interface\) '
        return "{\<Enter>};\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        " Probably inside a function call. Close it off.
        return "{\<Enter>});\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()

"----------------------------------------------
" Colors
"----------------------------------------------
"colorscheme PaperColor
colorscheme one
"colorscheme OceanicNext
set background=dark
set termguicolors

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_powerline_fonts=1
let g:airline_section_c='%t%m'
let g:airline_section_y=''
let g:airline_detect_modified=1
"let g:airline#extensions#tabline#enabled = 2
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#right_sep = ' '
"let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_theme='oceanicnext'

"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
if has('nvim')
    " Enable deoplete on startup
    let g:echodoc#enable_at_startup = 1
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#disable_auto_complete = 1
    let g:deoplete#sources#jedi#python_path='/usr/local/bin/python3'
    inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

endif

" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

"-----------------------------------------------
" Golang
" ----------------------------------------------
let g:deoplete#sources#go#gocode_binary = '/Users/jberria/go/bin/gocode'

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

map <leader>gd :GoDef<cr>

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1

" gometalinter configuration
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'errcheck',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'golint',
    \ 'gosimple',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
    \]

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set noexpandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2

"----------------------------------------------
" Language: TypeScript
"----------------------------------------------
au FileType typescript set noexpandtab
au FileType typescript set shiftwidth=2
au FileType typescript set softtabstop=2

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set noexpandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

" Show status bar by default.
set laststatus=2

" ---------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <F2> :NERDTreeToggle<cr>

" Files to ignore
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
\]

" Show hidden files by default.
let NERDTreeShowHidden = 1

" Allow NERDTree to change session root.
let g:NERDTreeChDirMode = 2

"----------------------------------------------
" Plugin: sebdah/vim-delve
"----------------------------------------------
" Set the Delve backend.
let g:delve_backend = "native"

