"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
let mapleader = ","
let maplocalleader = ","
set updatetime=150
set timeoutlen=1000 ttimeoutlen=50
set history=10000
set undofile
set hidden
set undolevels=100
set undoreload=1000
set nobackup
set nowritebackup
set noundofile
set nowrap
set noswapfile
set nocursorline
set shortmess+=c
set autochdir


" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2


" interface
set signcolumn=yes
set so=13
set number


" completion
set cmdheight=1
set pumheight=13
set completeopt=menuone,noinsert,noselect

" last line history
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap! <C-h> <Left>
noremap! <C-j> <Down>
noremap! <C-k> <Up>
noremap! <C-l> <Right>
nnoremap tn :tabnew<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" clipboard
set clipboard+=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Format when SAVE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

