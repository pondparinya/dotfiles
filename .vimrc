""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine' " เส้นเยื้องด้วยการวันบรรทัด
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} " live html
Plug 'tpope/vim-commentary' " gc for comment
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim' " keep
Plug 'tpope/vim-fugitive' " keep
Plug 'airblade/vim-gitgutter' " for git
Plug 'christoomey/vim-tmux-navigator' " keep
Plug 'mg979/vim-visual-multi' " keep
Plug 'sbdchd/neoformat'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " for markdown
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plug 'weirongxu/plantuml-previewer.vim' "for plantuml
Plug 'tyru/open-browser.vim' " keep
Plug 'aklt/plantuml-syntax'  "for plantuml
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " instant increment completion
Plug 'vim-airline/vim-airline' " keep
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " keep

" Theme colors
Plug 'NLKNguyen/papercolor-theme'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'joshdick/onedark.vim'
Plug 'jcherven/jummidark.vim'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
syntax enable
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

" => Indent Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => NVIM Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:clipboard = {
"            \   'name': 'myClipboard',
"            \   'copy': {
"            \      '+': 'pbcopy',
"            \      '*': 'pbcopy',
"            \   },
"            \   'paste': {
"            \      '+': '+',
"            \      '*': '*',
"            \   },
"            \   'cache_enabled': 1,
"            \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set cursorline
set background=dark
colorscheme PaperColor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Format when SAVE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" let g:autoformat_autoindent = 1
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
" let g:prettier#autoformat = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual Multi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VM_leader = '\'
let g:VM_theme = "lightpurple2"
let g:VM_maps = {}
let g:VM_maps["Select All"]        = '<leader>a'
let g:VM_maps["Visual All"]        = '<leader>a'
let g:VM_maps["Align"]             = '<leader>A'
let g:VM_maps["Add Cursor Down"]   = '<C-Down>'
let g:VM_maps["Add Cursor Up"]     = '<C-Up>'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git Gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gitgutter_max_signs=300
let g:gitgutter_signs = 1
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 1

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = "github"
let g:airline_extensions = ['tabline', 'coc', 'fugitiveline', 'wordcount', 'branch']
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>nb :NERDTreeFromBookmark<Space>
nnoremap <leader>nf :NERDTreeFind<cr>
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 1
" let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules', 'vendor']
let g:NERDTreeStatusline = ''
let NERDTreeChDirMode=2


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType nerdtree setlocal signcolumn=no

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
      \'coc-sh',
      \'coc-json',
      \'coc-git',
      \'coc-tsserver',
      \'coc-highlight',
      \'coc-go',
      \'coc-prettier',
      \'coc-emmet',
      \'coc-python'
    \]
inoremap <silent><expr> <Tab> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

