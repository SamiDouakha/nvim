require("core.plugins")
require("core.keymaps")
require("core.options")

-- Utilisation de xclip pour Linux
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_command('set clipboard=unnamedplus')
vim.api.nvim_command('set clipboard^=unnamed')
