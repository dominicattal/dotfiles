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
require("lazy").setup({
  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
      vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ffffff", bg = "#666699", bold = true })
      vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#cccccc", bg = "#2a2a2a" })
    end
  }
})
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "json" }, -- you can also use "all" or add more languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.h",
  callback = function()
    vim.bo.filetype = "c"
  end,
})
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
vim.treesitter.language.add('c')
vim.treesitter.language.add('cpp')
vim.opt.shell=bash
vim.opt.belloff=all
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.autoindent=true
vim.opt.shellcmdflag="-c"
vim.opt.relativenumber=true
vim.opt.number=true
vim.cmd([[autocmd TermOpen * setlocal number relativenumber]])
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * set formatoptions=jl]])
--vim.cmd("syntax off")
