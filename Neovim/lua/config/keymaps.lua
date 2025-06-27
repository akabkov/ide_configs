-- ========================================
-- ⌨️ Клавиши Vim
-- ========================================
local keymap = vim.keymap.set
local modes = { 'n', 'v', 'x', 's', 'o' }

-- Безопасное удаление и изменение (не сохраняет в регистр)
keymap('n', 'c',  '"_c')
keymap('n', 'C',  '"_C')
keymap('n', 'd',  '"_d')
keymap('n', 'dd', '"_dd')
keymap('n', 'D',  '"_D')
keymap('n', 's', '"_s')
keymap('n', 'S', '"_S')

keymap('v', 'c',  '"_c')
keymap('v', 'C',  '"_C')
keymap('v', 'd',  '"_d')
keymap('v', 'D',  '"_D')
keymap('v', 's', '"_s')
keymap('v', 'S', '"_S')

-- Быстрый выход из insert режима
keymap('i', 'jj', '<Esc>')
-- рус
keymap('i', 'оо', '<Esc>')

-- Ctrl+A выделяет весь текст
keymap('i', '<C-a>', '<Esc>ggVG')
keymap('n', '<C-a>', 'ggVG')
keymap('v', '<C-a>', '<Esc>ggVG')

-- Ctrl+Z отменяет последнее изменение (undo)
keymap('i', '<C-z>', '<Esc>ua')

-- Shift + стрелки: выделение текста из Insert-режима
keymap('i', '<S-Left>', '<C-O>v<Left>')
keymap('i', '<S-Right>', '<C-O>v<Right>')
keymap('i', '<S-Up>', '<C-O>v<Up>')
keymap('i', '<S-Down>', '<C-O>v<Down>')

-- Команды сохранения, выхода и терминала
keymap('n', '<Esc>', '<cmd>nohlsearch<CR><Esc>')
keymap(modes, '<leader>q', '<cmd>q!<CR>')
keymap(modes, '<leader>Q', '<cmd>wq<CR>')
keymap(modes, '<leader>w', '<cmd>w<CR>')
keymap(modes, '<leader>W', ':w ')
keymap(modes, '<leader>r', ':r ')
keymap(modes, '<leader>t', '<cmd>:terminal<CR>i')

-- ========================================
-- 🖱️ Быстрая прокрутка колесом
-- ========================================
local scroll_speed = 8 -- Скорость прокрутки (в строках)

vim.cmd(string.format([[
  noremap <silent> <ScrollWheelUp>   %d<C-U>
  noremap <silent> <ScrollWheelDown> %d<C-D>
]], scroll_speed, scroll_speed))
