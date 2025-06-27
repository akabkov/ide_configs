-- ========================================
-- 🧠 Общие настройки
-- ========================================
local opt = vim.opt

vim.g.mapleader = ' '              -- Основной лидер
vim.g.maplocalleader = '\\'        -- Локальный лидер
vim.cmd.colorscheme('habamax')     -- Цветовая схема
opt.spelllang = { 'en', 'ru' }     -- Языки для проверки орфографии
opt.clipboard = 'unnamedplus'      -- Использовать системный буфер обмена (Wayland: sudo apt install wl-clipboard)

-- ========================================
-- 📜 Отображение
-- ========================================
opt.number = true                  -- Показывать номера строк
opt.relativenumber = true          -- Относительная нумерация
opt.cursorline = true              -- Подсвечивать текущую строку
opt.colorcolumn = '100'            -- Вертикальная линия на 99 символов
opt.signcolumn = 'yes'             -- Постоянно показывать колонку для символов (diagnostics/git)
opt.list = true                    -- Показывать спецсимволы (таб, пробел и пр.)
opt.listchars = {
    tab = '→ ',
    space = '·',
}
opt.fillchars = {                  -- Символы для разных элементов интерфейса
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.linebreak = true               -- Перенос строк без разрыва слов
opt.termguicolors = true           -- Поддержка 24-bit цветов (true color)
opt.foldlevel = 99                 -- Открывать файл развёрнутым
opt.formatoptions = 'jcroqlnt'     -- Опции автоформатирования
opt.grepformat = '%f:%l:%c:%m'     -- Формат результатов поиска
opt.inccommand = 'nosplit'         -- Показывать предпросмотр замены
opt.splitkeep = 'screen'           -- Сохранять содержимое при разделении
opt.laststatus = 3                 -- Глобальная строка статуса
opt.shortmess:append({ W = true, I = true, c = true, C = true }) -- Укороченные сообщения
opt.showmode = false               -- Не показывать режим (есть строка статуса)
opt.updatetime = 200               -- Частота обновления интерфейса
opt.winminwidth = 5                -- Минимальная ширина окна
-- Функции для сворачивания блоков
opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
opt.foldmethod = 'expr'
opt.foldtext = ''


-- ========================================
-- 🧭 Навигация и прокрутка
-- ========================================
opt.scrolloff = 4                  -- Отступ от края при вертикальной прокрутке
opt.sidescrolloff = 4              -- Отступ от края при горизонтальной прокрутке
opt.splitright = true              -- Вертикальные сплиты справа
opt.splitbelow = true              -- Горизонтальные сплиты снизу
opt.mouse = 'a'                    -- Включить поддержку мыши
opt.virtualedit = 'block'          -- Разрешить курсору перемещаться за текст в визуальном режиме
opt.jumpoptions = 'view'           -- Возврат в предыдущую позицию окна при переходе по jumplist
opt.smoothscroll = true            -- Плавная прокрутка

-- ========================================
-- 🔍 Поиске
-- ========================================
opt.ignorecase = true              -- Игнорировать регистр при поиске...
opt.smartcase = true               -- ...если нет заглавных — регистр игнорируется
opt.hlsearch = true                -- Подсветка результатов поиска
opt.incsearch = true               -- Инкрементальный поиск
opt.grepprg = 'rg --vimgrep'       -- Утилита для поиска (ripgrep)

-- ========================================
-- ⌨️ Поведение клавиш и ввод
-- ========================================
opt.timeoutlen = 250               -- Ожидание ввода следующего комбо (ms)
opt.backspace = 'indent,eol,start' -- Поведение клавиши Backspace
opt.autoread = true                -- Автоматически перечитывать файл, если он изменён извне
opt.wildmode = "longest:full,full" -- Поведение автодополнения командной строки

-- ========================================
-- 🔠 Редактирование и отступы
-- ========================================
opt.tabstop = 4                    -- Ширина табуляции (в пробелах)
opt.softtabstop = 4                -- Вставка таба в insert-режиме
opt.shiftwidth = 4                 -- Отступ для >> и <<
opt.shiftround = true              -- Округлять отступ при табуляции
opt.expandtab = true               -- Заменять табы на пробелы
opt.smartindent = true             -- Умная автоиндентация
