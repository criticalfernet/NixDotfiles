vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = ","
vim.opt.incsearch = true
vim.keymap.set('n',';',':')
vim.keymap.set('n','<C-t>',':tabnew<cr>')
vim.keymap.set('n','<C-h>','gT')
vim.keymap.set('n','<C-l>','gt')
vim.keymap.set('v','<C-j>',":m '>+1<cr>gv=gv")
vim.keymap.set('v','<C-k>',":m '<-2<cr>gv=gv")
vim.keymap.set('n','<C-d>','<C-d>zz')
vim.keymap.set('n','<C-u>','<C-u>zz')
vim.keymap.set('n','n','nzz')
vim.keymap.set('n','N','Nzz')
vim.keymap.set('x','<leader>p','\"_dp')
vim.keymap.set('n','<leader>d','\"_d')
vim.keymap.set('v','<leader>d','\"_d')
vim.keymap.set('n','<leader>y','\"+y')
vim.keymap.set('v','<leader>y','\"+y')
vim.keymap.set('n','<leader>s',":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left><Left>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- PLUGINS TABLE
require("lazy").setup("plugins")
