call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'vim-airline/vim-airline'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'

" Python
Plug 'zchee/deoplete-jedi'

" Rust
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

"Go
" Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}      " Go auto completion
Plug 'sebdah/vim-delve'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'

" Typescript
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'HerringtonDarkholme/yats.vim'

" Colorschemes
Plug 'tomasiser/vim-code-dark'
Plug 'dunstontc/vim-vscode-theme'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
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
set updatetime=750                " redraw the status bar often
set noshowmode
set noshowcmd
set hidden
set ignorecase
set signcolumn=yes
syntax enable

let mapleader = ','
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
" Remove trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e
" ignore files / folders
set wildignore+=*/node_modules/*

"----------------------------------------------
" FZF
"----------------------------------------------
set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore node_modules --ignore .git -g ""'
noremap <C-p> :Files<cr>
noremap <C-r> :BLines<space>
noremap <C-s> :Ag<space>
noremap ;			:Buffers<cr>

noremap <leader>gd :Gvdiff<cr>
noremap <leader>gc :Commits<cr>
noremap <leader>gs :Gstatus<cr>

" Delete the current buffer without leaving split window
nnoremap <leader>bd :bp\|bd#<cr>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"-----------------------------------------------
" Easymotion
"-----------------------------------------------
nmap <leader><leader> <Plug>(easymotion-bd-w)

"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch                     " move to match as you type the search query
set hlsearch                      " disable search result highlighting
map <leader>c :nohlsearch<cr>     " clear search highlights

if has('nvim')
    set inccommand=split          " enables interactive search and replace
endif


" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" ... but skip the quickfix when navigating
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

"----------------------------------------------
" Curly brace close
"----------------------------------------------
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
set termguicolors
set cul
highlight VertSplit guibg=off
highlight VertSplit guifg=off
set guifont=Monospace:h12
colorscheme dark_plus

let g:airline_powerline_fonts=1
let g:airline_section_c='%t%m'
let g:airline_section_y=''
let g:airline_section_z='%p%%'
let g:airline_detect_modified=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='codedark'

"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
if has('nvim')
		" Disable the candidates in Comment/String syntaxes.
		call deoplete#custom#source('_',
		\ 'disabled_syntaxes', ['Comment', 'String'])

    call deoplete#custom#option('ignore_sources', {'_': ['buffer', 'around']})
    call deoplete#custom#option('auto_complete', v:false)
    call deoplete#custom#option('refresh_always', v:true)

    let g:echodoc#enable_at_startup = 1
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#sources#jedi#python_path='/usr/local/bin/python3'

    " let g:deoplete#disable_auto_complete = 1
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
" function g:Multiple_cursors_before()
"   call deoplete#custom#buffer_option('auto_complete', v:false)
" endfunction
" function g:Multiple_cursors_after()
"   call deoplete#custom#buffer_option('auto_complete', v:true)
" endfunction

"-----------------------------------------------
" Ale
" ----------------------------------------------
let g:airline#extensions#ale#enabled=1

let g:ale_fixers= {'javascript': ['eslint'], 'typescript': ['tslint']}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed='never'
let g:ale_sign_error='●'
let g:ale_lint_on_save=1
let g:ale_list_window_size=5
let g:ale_completion_enabled=0

let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1


"-----------------------------------------------
" Language: Golang
" ----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=2
au FileType go set softtabstop=2
au FileType go set tabstop=2

" map <leader>gd :GoDoc<cr>
map <leader>gj :GoDef<cr>

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
let g:deoplete#sources#go#gocode_binary = '/Users/jberria/go/bin/gocode'

" gometalinter configuration
let g:go_metalinter_deadline = "10s"
let g:go_metalinter_enabled = ['vet', 'golint', 'deadcode', 'errcheck', 'structcheck']

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2

"----------------------------------------------
" Language: TypeScript
"----------------------------------------------
au FileType typescript set expandtab
au FileType typescript set shiftwidth=2
au FileType typescript set softtabstop=2
au FileType typescript nnoremap <buffer> <leader>td :TSDef<cr>
au FileType typescript nnoremap <buffer> <F2> :TSRenam<cr>

let g:nvim_typescript#javascript_support=1

"----------------------------------------------
" Language: Rust
"----------------------------------------------
au FileType rust set expandtab
au FileType rust set shiftwidth=2
au FileType rust set softtabstop=2
au FileType rust nmap gd <Plug>(rust-def-split)

let g:racer_cmd = '/Users/jberria/.cargo/bin/racer'
let g:racer_experimental_completer=1

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
nnoremap <C-b> :NERDTreeToggle<cr>

" ---------------------------------------------
" vim-netrw
"----------------------------------------------
let g:netrw_liststyle=1
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=25

" Files to ignore
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
\]

let NERDTreeShowHidden = 1  " Show hidden files by default.
let g:NERDTreeChDirMode = 2 " Allow NERDTree to change session root.

"----------------------------------------------
" Plugin: sebdah/vim-delve
"----------------------------------------------
let g:delve_backend = "native" " Set the Delve backend.

