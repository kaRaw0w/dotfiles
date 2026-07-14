vim.g.mapleader = " "

-- Сохранение, выход и работа с файлами
vim.keymap.set("n", "<leader>wq", ":wq<CR>") -- сохранить и выйти
vim.keymap.set("n", "<leader>qq", ":q!<CR>") -- выйти без сохранения
vim.keymap.set("n", "<leader>ww", ":w<CR>") -- сохранить
vim.keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- открыть URL под курсором

vim.opt.clipboard = "unnamedplus"
-- Управление вкладками
vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- открыть новую вкладку
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- закрыть текущую вкладку
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- следующая вкладка
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- предыдущая вкладка
vim.keymap.set("n", "<leader>tl", ":tablast<CR>") -- последняя вкладка
vim.keymap.set("n", "<leader>tf", ":tabfirst<CR>") -- первая вкладка

-- Переключение между буферами
vim.keymap.set("n", "<leader>bn", ":bnext<CR>") -- следующий буфер
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>") -- предыдущий буфер
vim.keymap.set("n", "<leader>bd", ":bd<CR>") -- закрыть текущий буфер

-- Навигация по окнам
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')

-- Сплиты
vim.keymap.set('n', '|', ':vsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')
vim.wo.number = true
vim.wo.relativenumber = true

vim.g.did_load_filetypes = 1
vim.g.formatoptions = "qrn1"
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.wo.signcolumn = "no"
vim.opt.foldcolumn = "0"
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.wo.linebreak = true
vim.opt.virtualedit = "block"
vim.opt.undofile = true
vim.opt.shell = "/bin/zsh"
vim.opt.swapfile = false

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Shorter messages
vim.opt.shortmess:append("c")

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Fillchars
vim.opt.fillchars = {
    vert = "│",
    fold = "⠀",
    eob = " ", -- suppress ~ at EndOfBuffer
    -- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}
-- Enable auto-indentation
vim.opt.autoindent = true

-- Enable smart indentation for specific cases (if, loops, etc.)
vim.opt.smartindent = true

-- Enable automatic adjustment based on file type
vim.opt.filetype.indent = true
vim.g.sleuth_enabled = 1 -- if using vim-sleuth

vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight clear SignColumn]])

