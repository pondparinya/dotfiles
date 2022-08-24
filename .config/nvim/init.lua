-- vim.cmd[[ source ~/dotfiles/.config/nvim/v1/init-v1.vim ]]

-- local impatient_ok, impatient = pcall(require, "impatient")
-- if impatient_ok then
-- 	impatient.enable_profile()
-- end

require("core.keymaps")


require("plugins.configs.colortheme")

require("core.packers").bootstrap()

require("plugins").run()

require("core.general")
require("core")

