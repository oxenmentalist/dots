-- ~/.config/nvim/init.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- UI/UX basics
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 4

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:2"
vim.opt.showbreak = "↳ "
vim.opt.formatoptions:remove({ "t", "c", "r", "o" })
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8


-- Sensible editing
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.updatetime = 250        -- faster diagnostics/cursorhold
vim.opt.timeoutlen = 300        -- makes 'jk' feel snappy

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2


-- Keymaps
local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Insert mode: 'jk' to escape
map("i", "jk", "<Esc>", opts)
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)


require("lazy").setup({
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function() 
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
})
