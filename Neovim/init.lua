-- В качестве менеджера плагинов используется lazy.nvim
-- Для установки плагинов просто скопируйте файлы в соответствии с указной ниже структурой.
-- В начале каждого файла краткий коментарий с описанием функции соответствующего плагина.

-- ========================================
-- 🗂️  Структура каталогов и файлов
-- ========================================
-- ~/.config/nvim/
          -- ├── init.lua
          -- └── lua
              -- ├── config
              -- │   ├── keymaps.lua
              -- │   ├── lazy.lua
              -- │   └── options.lua
              -- └── plugins
                  -- ├── langmapper.lua
                  -- ├── leap.lua
                  -- ├── lualine.lua
                  -- ├── mini.lua
                  -- ├── scrollbar.lua
                  -- └── windsurf.lua

-- ========================================
-- Для работы автопереключения раскладки при смене режимив (n, v, i) сменить систему ввода на fcitx5:
-- ========================================
-- sudo apt update
-- sudo apt install fcitx5
-- sudo apt purge ibus          # удаляем систему ввода по умолчанию
-- sudo apt autoremove --purge
-- sudo apt full-upgrade
-- sudo apt autoclean

-- Затем в настройках системы:
-- System -> Region & Language -> Manage Installed Languages -> Keyboard input method -> Fcitx 5

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
-- 🛠️ Симлинки для запуска от root
-- ========================================
-- sudo ln -s ~/.cache/nvim /root/.cache/nvim
-- sudo ln -s ~/.codeium /root/.codeium
-- sudo ln -s ~/.config/nvim /root/.config/nvim
-- sudo ln -s ~/.local/share/nvim /root/.local/share/nvim
-- sudo ln -s ~/.local/state/nvim/ /root/.local/state/nvim
-- (предварительно проверить наличие родительских каталогов
-- и удалить существующие конечные директории /root/.../nvim)

-- ========================================
-- 📦 Загрузка модулей lua (порядок имеет значение!)
-- ========================================
require("config.options")  -- настройки vim.opt
require("config.keymaps")  -- биндинги клавиш
require("config.lazy")     -- загрузка плагинов

-- 🌐 Автомаппинг для langmapper.nvim
require('langmapper').automapping({ global = true, buffer = true })
