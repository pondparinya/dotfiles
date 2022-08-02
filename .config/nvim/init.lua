-- vim.cmd[[ source ~/dotfiles/.config/nvim/v1/init-v1.vim ]]


require("core")
require("core.general")
require("core.keymaps")
require("core.packer").bootstrap()

require("plugins").run()
