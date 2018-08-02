set nocompatible              " be iMproved, required

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


" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mxw/vim-jsx'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lumiliet/vim-twig'
Plug 'mhartington/oceanic-next'
Plug 'cespare/vim-toml'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

call plug#end()

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

" for vim 8
if (has("termguicolors"))
 set termguicolors
endif

let g:solarized_termcolors=16

" Map FZF to Ctrl+P
nnoremap <C-P> :FZF<CR>

" Color Scheme

"colorscheme solarized
"colorscheme atom
"colorscheme oceandeep
"colorscheme sorcerer
colorscheme OceanicNext
