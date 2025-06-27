-- Langmapper для неанглийских методов ввода

-- ========================================
-- Для работы автопереключения раскладки при выходе из insert mode необходимо в качестве системы
-- управления методами ввода установить fcitx5 вместо ibus:
-- sudo apt update
-- sudo apt install fcitx5
-- sudo apt purge ibus
-- sudo apt autoremove --purge
-- sudo apt full-upgrade
-- sudo apt autoclean

-- Затем в настройках системы:
-- System -> Region $ Language -> Manage Installed Languages -> Keyboard input method -> Fcitx 5

-- В файле /etc/environment добавить в конце:
-- INPUT_METHOD=fcitx
-- XMODIFIERS="@im=fcitx"
-- GTK_IM_MODULE=fcitx
-- QT_IM_MODULE=fcitx

-- Добавить Fcitx 5 в автозагрузку:
-- sudo cp /usr/share/applications/org.fcitx.Fcitx5.desktop /etc/xdg/autostart/

-- Перезагрузить систему
-- Откройте Fcitx 5 Configuration и добавьте нужный метод ввода
-- ========================================

return {
  'Wansmer/langmapper.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local function escape(str)

      local escape_chars = [[;,."|\]]
      return vim.fn.escape(str, escape_chars)
    end

    local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
    local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
    local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
    local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

    vim.opt.langmap = vim.fn.join({
      escape(ru_shift) .. ';' .. escape(en_shift),
      escape(ru) .. ';' .. escape(en),
    }, ',')

    require('langmapper').setup({
      map_all_ctrl = true,
      ctrl_map_modes = { 'n', 'v', 'x', 's', 'o', 'i', 'c', 't' },
      hack_keymap = true,
      disable_hack_modes = { 'i' },
      automapping_modes = { 'n', 'v', 'x', 's', 'o' },
      default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}~abcdefghijklmnopqrstuvwxyz,.;'[]`]],
      use_layouts = {},
      custom_desc = nil,
      layouts = {
        ru = {
          id = 'keyboard-ru', -- указать строку возвращаемую функцией get_current_layout_id()
          layout = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪËфисвуапршолдьтщзйкыегмцчнябюжэхъё',
          default_layout = nil,
        },
      },
      os = {
        Linux = {
          get_current_layout_id = function()
            if vim.fn.executable('fcitx5-remote') == 1 then
              local output = vim.split(vim.trim(vim.fn.system('fcitx5-remote -n')), '\n')
              return output[#output]
            end
          end,
        },
      }
    })
  end,
}
