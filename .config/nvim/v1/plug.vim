"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
" FZF search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

" Indent
Plug 'Yggdroot/indentLine' " เส้นเยื้องด้วยการวันบรรทัด

" Comment
Plug 'tpope/vim-commentary' " gc for comment

" Directory nerdtree
Plug 'preservim/nerdtree'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " for markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " keep

" plantuml
Plug 'weirongxu/plantuml-previewer.vim' "for plantuml
Plug 'tyru/open-browser.vim' " keep
Plug 'aklt/plantuml-syntax'  "for plantuml

" Coc
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " instant increment completion

" Airline
Plug 'vim-airline/vim-airline' " keep
Plug 'vim-airline/vim-airline-themes'

" Theme colors
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'joshdick/onedark.vim'
Plug 'jcherven/jummidark.vim'

" cmp
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/nvim-cmp'

" nvim-tree
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Other
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plug 'tpope/vim-fugitive' " keep
Plug 'airblade/vim-gitgutter' " for git
Plug 'christoomey/vim-tmux-navigator' " keep
Plug 'mg979/vim-visual-multi' " keep
Plug 'sbdchd/neoformat'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

