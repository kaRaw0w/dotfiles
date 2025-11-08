require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "go", "cpp", "python", "latex", "cuda"},
  sync_install = false,
  indent = { enable = true },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Устанавливаем filetype .cl файлов как c
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.cl",
  callback = function()
    vim.bo.filetype = "c"
  end,
})
