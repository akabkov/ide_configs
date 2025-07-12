-- Для классического поведения Ctrl+C и Ctrl+V в Insert режиме,
-- добавить соответствующие комбинации в настройках самого терминала.

-- ========================================
-- ⌨️ Клавиши Vim
-- ========================================
local keymap = vim.keymap.set
local modes = { 'n', 'v', 'x', 's', 'o' }

-- Удаление без копирования в буфер обмена
keymap('n', 'c', '"_c')
keymap('n', 'C', '"_C')
keymap('n', 'd', '"_d')
keymap('n', 'dd', '"_dd')
keymap('n', 'D', '"_D')
keymap('n', 's', '"_s')
keymap('n', 'S', '"_S')
keymap('n', 'x', '"_x')
keymap('n', 'X', '"_X')

keymap('v', 'c', '"_c')
keymap('v', 'C', '"_C')
keymap('v', 'd', '"_d')
keymap('v', 'D', '"_D')
keymap('v', 's', '"_s')
keymap('v', 'S', '"_S')

-- Быстрый выход из INSERT режима
keymap('i', 'jj', '<Esc>')
keymap('i', 'оо', '<Esc>') -- рус

-- Включение/отключение Windsurf
keymap('i', 'ww', '<Esc>:Codeium Toggle<CR>a')
keymap('i', 'цц', '<Esc>:Codeium Toggle<CR>a') -- рус

-- Тройные кавычки для многострочной строки
keymap('i', "''", '"""')

-- Комментирование через Ctrl+/ с переходом на следующую строку в INSERT режиме
keymap('i', '<C-_>', function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
  require('Comment.api').toggle.linewise.current()
  vim.api.nvim_feedkeys('j', 'n', true)
  vim.api.nvim_feedkeys('a', 'n', true)
end, { noremap = true, silent = true })

-- Ctrl+A выделяет весь текст
keymap('i', '<C-a>', '<Esc>ggVG')
keymap('n', '<C-a>', 'ggVG')
keymap('v', '<C-a>', '<Esc>ggVG')

-- Ctrl+Z отменяет последнее изменение (в Insert режиме)
keymap('i', '<C-z>', '<Esc>ua')

-- Shift + стрелки: выделение текста из Insert-режима
keymap('i', '<S-Left>', '<C-O>v<Left>')
keymap('i', '<S-Right>', '<C-O>v<Right>')
keymap('i', '<S-Up>', '<C-O>v<Up>')
keymap('i', '<S-Down>', '<C-O>v<Down>')

-- Команды сохранения, выхода и терминала
keymap(modes, '<leader>q', '<cmd>q!<CR>')
keymap(modes, '<leader>w', '<cmd>wq<CR>')
keymap(modes, '<leader>s', '<cmd>w<CR>')
keymap(modes, '<leader>r', ':r ')
keymap(modes, '<leader>t', '<cmd>:terminal<CR>i')

keymap('n', 'H', '<cmd>nohlsearch<CR>')

-- ========================================
-- 🖱️ Быстрая прокрутка колесом
-- ========================================
local scroll_speed = 8 -- Скорость прокрутки (в строках)

vim.cmd(string.format([[
  noremap <silent> <ScrollWheelUp>   %d<C-U>
  noremap <silent> <ScrollWheelDown> %d<C-D>
]], scroll_speed, scroll_speed))
