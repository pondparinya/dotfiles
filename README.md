==============================================================================
CONTENTS                                                        *key-mappings*
==============================================================================

  1. Introduction                                     |keymaps & keyboard|
  2. Nvim-tree                                        |nvim-tree-key-mappings|

==============================================================================
  1. Introduction
==============================================================================

 -----------------------------------------------
|    KEY-MAP      |    KEYBOARD                 |
|-----------------|-----------------------------|
|    "<CR>"       |   button Enter              |
|    "<leader>"   |   button ,                  |
|    "<ESC>"      |   button ESC                |
|    "<S-*>"      |   button Left Shift         |
|    "<C-*>"      |   button Left Control       |
|    "<A-*>"      |   button Left Command/Option|
 -----------------------------------------------

==============================================================================
  2. Nvim-tree
==============================================================================

 ----------------------------------------------------------------------------
|    MODE    |     KEY          |     ACTIONS                                |
|------------|------------------|--------------------------------------------                 
|   normal   |     "o"          |  open folder or file                       |                 
|   normal   |     "O"          |  system open                               |
|   normal   |     "s"          |  split
|   normal   |     "i"          |  vsplit                                       
|   normal   |     "W"          |  collapse the whole all tree               
|   normal   |     "E"          |  expand the whole all tree
|   normal   |     "<C-n>"      |  Toggle Nvim-tree | current dir |                 
|   normal   |     "<leader>e"  |  Focus Nvim-tree | current dir |
|   normal   |     "S"          |  search node
|   normal   |     "f"          |  filter
|   normal   |     "F"          |  clear filter
|   normal   |     "q"          |  close
|   normal   |     "<C-k>"      |  toggle file info
|   normal   |     "a"          |  create file/folder
|   normal   |     "r"          |  rename file/folder
|   normal   |     "R"          |  refresh tree
|   normal   |     "c"          |  copy  file/folder to clipboard
|   normal   |     "p"          |  past file/folder from clipboard
|   normal   |     "y"          |  copy name to clipboard
|   normal   |     "Y"          |  copy absolute path to clipboard
|   normal   |     "g?"         |  toggle help

                                                                                              
DEFAULT KEY 
  - https://github.com/kyazdani42/nvim-tree.lua/blob/261a5c380c000e23c4a23dcd55b984c856cdb113/doc/nvim-tree-lua.txt#L1164

