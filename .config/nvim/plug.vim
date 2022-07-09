"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
Plug 'vim-airline/vim-airline-themes'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " keep

" Theme colors
Plug 'morhetz/gruvbox'
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

