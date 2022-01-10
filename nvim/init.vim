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

nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
nmap <leader>er :vsplit ~/.config/nvim/init.vim<cr>

nmap <leader>u :undo;

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" nerdtree
nnoremap <leader>e :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

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

" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fzf.vim
" source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/nerdtree.vim
" source ~/.config/nvim/plugins/visual-multi.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/cargo.vim
" source ~/.config/nvim/plugins/lsp.vim
" source ~/.config/nvim/plugins/nord.vim

call plug#end()
doautocmd User PlugLoaded
