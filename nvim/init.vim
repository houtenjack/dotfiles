"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set guicursor=
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·,space:·
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set confirm
set exrc
set noswapfile
" set backup
" set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
let g:python3_host_prog='~/.pyenv/versions/pynvim/bin/python3'

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "`"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <leader>pv :Vex<CR>
nnoremap <leader>pf :Files<CR>
" inoremap jk <esc>:w<CR>
" open new split panes to right and below
set splitright
set splitbelow

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" remap for indent/dedent
" :noremap <C-]> > gv
" :noremap <C-[> < gv

" nerdtree
" nnoremap <leader>e :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/visual-multi.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/nord.vim
source ~/.config/nvim/plugins/iceberg.vim
source ~/.config/nvim/plugins/vim-tmux-navigator.vim
source ~/.config/nvim/plugins/vim-fugitive.vim
source ~/.config/nvim/plugins/markdown-preview.vim
source ~/.config/nvim/plugins/swap-lines.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/sneak.vim
source ~/.config/nvim/plugins/match.vim
Plug 'ryanoasis/vim-devicons'
Plug 'gkeep/iceberg-dark'
let g:lightline = { 'colorscheme': 'icebergDark' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" colorscheme nord
colorscheme iceberg

" Quick-save
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

doautocmd User PlugLoaded
