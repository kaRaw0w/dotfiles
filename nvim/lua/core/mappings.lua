vim.g.mapleader = " "

-- Сохранение, выход и работа с файлами
vim.keymap.set("n", "<leader>wq", ":wq<CR>") -- сохранить и выйти
vim.keymap.set("n", "<leader>qq", ":q!<CR>") -- выйти без сохранения
vim.keymap.set("n", "<leader>ww", ":w<CR>") -- сохранить
vim.keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- открыть URL под курсором

-- Управление вкладками
vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- открыть новую вкладку
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- закрыть текущую вкладку
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- следующая вкладка
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- предыдущая вкладка
vim.keymap.set("n", "<leader>tl", ":tablast<CR>") -- последняя вкладка
vim.keymap.set("n", "<leader>tf", ":tabfirst<CR>") -- первая вкладка

-- Изменение размера с помощью Ctrl + Стрелки
vim.keymap.set("t", "<C-Up>", "<C-\\><C-n><cmd>resize +2<CR>i")
vim.keymap.set("t", "<C-Down>", "<C-\\><C-n><cmd>resize -2<CR>i")
vim.keymap.set("t", "<C-Left>", "<C-\\><C-n><cmd>vertical resize -2<CR>i")
vim.keymap.set("t", "<C-Right>", "<C-\\><C-n><cmd>vertical resize +2<CR>i")

-- Переключение между буферами M - alt если что
-- silent - не выводит снизу информацию о набираемой команде
--
vim.keymap.set("n", "<M-1>", "<Cmd>BufferGoto 1<CR>", { silent = true }) 
vim.keymap.set("n", "<M-2>", "<Cmd>BufferGoto 2<CR>", { silent = true })
vim.keymap.set("n", "<M-3>", "<Cmd>BufferGoto 3<CR>", { silent = true })
vim.keymap.set("n", "<M-4>", "<Cmd>BufferGoto 4<CR>", { silent = true })
vim.keymap.set("n", "<M-5>", "<Cmd>BufferGoto 5<CR>", { silent = true })
vim.keymap.set("n", "<M-6>", "<Cmd>BufferGoto 6<CR>", { silent = true })
vim.keymap.set("n", "<M-7>", "<Cmd>BufferGoto 7<CR>", { silent = true })
vim.keymap.set("n", "<M-8>", "<Cmd>BufferGoto 8<CR>", { silent = true })
vim.keymap.set("n", "<M-9>", "<Cmd>BufferGoto 9<CR>", { silent = true })
vim.keymap.set("n", "<M-q>", "<Cmd>BufferClose<CR>", { silent = true })

-- Навигация по окнам
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')

-- Сплиты
vim.keymap.set('n', '|', ':vsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')

-- В init.lua
-- Меняем makeprg на прямой вывод в терминал
vim.opt.makeprg = 'make 2>&1'

-- Теперь :make показывает вывод в терминале и не закрывается
vim.keymap.set('n', '<leader>mm', function()
    vim.cmd('botright split')
    vim.cmd('resize 15')
    vim.cmd('term make 2>&1')
    vim.cmd('startinsert')
end, { desc = 'Make in terminal' })
