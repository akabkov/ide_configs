-- Библиотека модулей mini.nvim

return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.pairs').setup()      -- Автозакрытие скобок, кавычек и парных символов
    require('mini.comment').setup()    -- Удобное комментирование строк и блоков кода
    require('mini.starter').setup()    -- Стартовый экран (стартовая страница Neovim)
    require('mini.jump').setup()       -- Быстрые переходы по тексту (f, F, t, T по всему тексту)
    require('mini.animate').setup()    -- Плавные анимации курсора и переходов
    require('mini.cursorword').setup() -- Подсветка всех вхождений слова под курсором
    require('mini.trailspace').setup() -- Подсветка и удаление пробелов в конце строк
  end,
}
