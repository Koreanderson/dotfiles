set nocompatible              " be iMproved, required
filetype off                  " required

set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set ruler
set relativenumber
set number
set mousehide
set cursorline
set hlsearch

" Turn on syntax highlighting
syntax on
set background=dark
" Set terminal colors
set t_Co=256

set directory=~/.vim/.swap " use a custom directory for swap files

set mouse=a
set laststatus=2

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

if has('gui_running')
	set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h11
endif

" Map twig syntax to jinja
au BufRead,BufNewFile *.twig set filetype=htmljinja

"  CSS Auto Bracket Completion
inoremap {<CR> {<CR><BS>}<Esc>ko

"  Paranthesis Auto Bracket Completion
inoremap (<CR> (<CR>);<Esc>ko<Tab>
"  Twig Auto Bracket Completion
inoremap {{ {{<space><space>}}<esc>2hi
inoremap {% {%<space><space>%}<esc>2hi


"  Remap Leader

let mapleader = ","

"  Vundle

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required

Bundle 'gmarik/vundle'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/emmet-vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'mxw/vim-jsx'
Bundle 'honza/vim-snippets'
"Bundle 'kien/ctrlp.vim'
"Bundle 'evidens/vim-twig'
Bundle 'lumiliet/vim-twig'
Bundle 'mhartington/oceanic-next'
Bundle 'cespare/vim-toml'
Bundle 'pangloss/vim-javascript'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'tomtom/tlib_vim'
Bundle 'sirver/ultisnips'

filetype plugin indent on     " required

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Ctrl P
set runtimepath^=~/.vim/bundle/ctrlp.vim

" ColorStepper Keys
"nmap <F6> <Plug>ColorstepPrev
"nmap <F7> <Plug>ColorstepNext
"nmap <S-F7> <Plug>ColorstepReload

" Nerd Tree toggle

nnoremap <silent> <leader>n :call g:WorkaroundNERDTreeToggle()<cr>
nnoremap <C-f> :NERDTreeFind<cr>

" after deleting all buffers with wipeout function, :NERDTreeToggle bugs out
" but the first call to :NERDTree fixes everything

function! g:WorkaroundNERDTreeToggle()
	try | :NERDTreeToggle | catch | :NERDTree | endtry
endfunction

" JSX Javascript highlighting
let g:jsx_ext_required = 0 " Allow JSX in normal JS files


" Rempap Emmet keys

let g:user_emmet_leader_key='<leader>'

" Airline
let g:airline_theme='light' "airline colors
"let g:airline_theme='oceanicnext'

let g:airline_powerline_fonts = 1 "enable patch fonts
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 0

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:Powerline_symbols = "fancy"

" Remap leader to switch windows instead of ctrl
noremap <leader>h <C-W>h
noremap <leader>j <C-W>j
noremap <leader>k <C-W>k
noremap <leader>l <C-W>l

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>5 6gt
noremap <leader>6 7gt
noremap <leader>7 8gt
noremap <leader>8 9gt
noremap <leader>9 10gt

syntax enable

" for vim 8
if (has("termguicolors"))
 set termguicolors
endif

" Color Scheme

colorscheme solarized
"colorscheme atom
"colorscheme oceandeep
"colorscheme sorcerer
"colorscheme OceanicNext
