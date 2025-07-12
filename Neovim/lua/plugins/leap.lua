-- Leap.nvim — быстрые прыжки по тексту

return {
  url = "https://codeberg.org/andyg/leap.nvim",
  config = function()
    local leap = require('leap')

    -- Прыжок в текущем окне
    vim.keymap.set({ 'n', 'v', 'x', 's', 'o' }, '<leader>f', function()
      leap.leap({ target_windows = { vim.fn.win_getid() } })
    end, { desc = 'Leap: обычный прыжок' })

    -- Прыжок во всех окнах
    vim.keymap.set({ 'n', 'v', 'x', 's', 'o' }, '<leader>F', function()
      leap.leap({ target_windows = require('leap.util').get_enterable_windows() })
    end, { desc = 'Leap: во всех окнах' })
  end,
}
