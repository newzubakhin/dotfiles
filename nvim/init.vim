"---------------------------
"For block in neovim
"---------------------------
set mouse=a
set guicursor=

"----------------------------
"Langmaps
"----------------------------
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
"Switch keymap <C-^>
set keymap=russian-jcukenwin

let g:python_host_prog = '/usr/bin/python'
let g:python2_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.6'

"---------------------------
"Plugins
"---------------------------
call plug#begin('/home/citizenfour/.config/nvim/bundle')
Plug 'sheerun/vim-polyglot'
" Plug 'python-mode/python-mode'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#auto_complete_delay = 10
"
Plug 'zchee/deoplete-jedi', {'for': 'python'}
	let g:deoplete#sources#jedi#show_docstring = 1
Plug 'davidhalter/jedi-vim'
	let g:jedi#completions_enabled = 0

Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
	" let g:jsx_ext_required = 0
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/bundle/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go', {'for': 'go'}
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_extra_types = 1
	" let g:go_highlight_operators = 1
	let g:go_auto_sameids = 1
"
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
"
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
	let g:airline_powerline_fonts = 1

Plug 'jiangmiao/auto-pairs'
" Plug 'luochen1990/rainbow'
" let g:rainbow_active = 1
Plug 'icymind/NeoSolarized'
" Plug 'morhetz/gruvbox'

" Plug 'ervandew/supertab'
	" let g:SuperTabDefaultCompletionType = "<C-n>"
"
" Plug 'zchee/deoplete-clang'
" Plug 'ternjs/tern_for_vim'
" let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
" let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
" Plug 'othree/html5.vim', { 'for': 'html' }
" Plug 'rust-lang/rust.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'vim-syntastic/syntastic'
" 	let g:syntastic_javascript_checkers=['eslint']
Plug 'w0rp/ale'
Plug 'slashmili/alchemist.vim'
Plug 'c-brenn/phoenix.vim'
call plug#end()
" call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

"---------------------------
"Enable true colors, theme etc
"---------------------------
set number
set iminsert=0
set imsearch=0
set lazyredraw

set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set expandtab
set list
" set listchars=tab:\·\ ",trail:~ ,extends:>,precedes:<
set incsearch
set ignorecase
set autowrite
set termguicolors
set background=dark
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set relativenumber
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber
" set rnu
" set cursorline
let g:neosolarized_italic = 0

colorscheme NeoSolarized
" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1
" deoplete tab-complete
" inoremap <silent><expr> <Tab>
"     \ pumvisible() ? "\<C-n>" : deoplete#manual_complete()
" inoremap <silent><expr> <s-Tab>
"     \ pumvisible() ? "\<C-p>" : deoplete#manual_complete()
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" autocmd VimEnter * NERDTree
nmap <C-n> :NERDTreeFind<cr>
" vmap <C-n> <esc>:NERDTreeFind<cr>i
" imap <C-n> <esc>:NERDTreeFind<cr>i

nmap <C-n>x :NERDTreeClose<cr>
" vmap <C-n>x <esc>:NERDTreeClose<cr>i
" imap <C-n>x <esc>:NERDTreeClose<cr>i

nmap <F8> :TagbarToggle<CR>

" Отвыкаем от стрелок
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Копировать в + выделенный текст
vnoremap <C-c> "+y

noremap <C-p> :FZF<cr>

function! NumberToggle()
	if(&rnu == 1)
		set nornu
		set nocursorline
	else
		set rnu
		set cursorline
	endif
endfunction

nnoremap <F9> :call NumberToggle()<CR>

nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left><Paste>
