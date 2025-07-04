# Vim-like IDE configurations for Ubuntu on Wayland

Цель данного репозитория — по возможности обеспечить **одинаковое Vim-подобное поведение** в средах **Neovim**, **JetBrains IDE** и **VSCode**. Это позволяет минимизировать переключение контекста между редакторами и работать эффективно в любой среде.

**Репозиторий включает:**

- Шрифты JetBrainsMonoNL Nerd Font Mono с установочным скриптом
- Инструкцию по переходу на Fcitx 5 как основную систему ввода (вместо `ibus`)
- Установщик и конфигурацию для Neovim и плагинов lazy.nvim
- Настройки и скрипт их установки для Sublime Text
- Конфигурационные файлы для VSCode
- Настройки IdeaVim для JetBrains IDE (`.ideavimrc`)

---

## Структура репозитория

<details>
  <summary>📁 ide_configs</summary>
  <pre>
├── JetBrainsMono
│   ├── install_font.sh                       # Скрипт установки шрифта в систему
│   ├── JetBrainsMonoNLNerdFontMono-*.ttf
│
├── Neovim
│   ├── init.lua                              # Основной конфиг Neovim с пояснениями по установке
│   ├── install_lazy.nvim_plugins.sh          # Скрипт установки плагинов lazy.nvim
│   ├── installer
│   │   ├── install_nvim.sh                   # Скрипт установки последней версии Neovim
│   │   ├── README
│   │   └── remove_nvim.sh                    # Удаление установленного Neovim (без очистки конфигурации)
│   └── lua
│       ├── config                            # Основные настройки: keymaps, options, загрузка lazy.nvim
│       │   ├── keymaps.lua
│       │   ├── lazy.lua
│       │   └── options.lua
│       └── plugins                           # Конфигурации отдельных плагинов Neovim
│           ├── langmapper.lua
│           ├── leap.lua
│           ├── lualine.lua
│           ├── mini.lua
│           ├── scrollbar.lua
│           └── windsurf.lua
│
├── README.md
│
├── SublimeText
│   ├── install_sublime_configs.sh            # Скрипт установки всех настроек Sublime Text
│   ├── kill_codeium_many_instances.sh        # Утилита для принудительного завершения зависших процессов Codeium
│   ├── README
│   └── sublime_configs                       # Файлы настроек Sublime Text
│       ├── comment_and_next_line.sublime-macro
│       ├── Default (Linux).sublime-keymap
│       ├── Package Control.sublime-settings
│       ├── Preferences.sublime-settings
│       ├── prettierd_format.sublime-settings
│       ├── Terminal.sublime-settings
│       └── Terminus.sublime-build
│
└── VSCode                                    # Основные настройки: keybindings и settings
    ├── extensions-list.txt
    ├── keybindings.json
    ├── README
    └── settings.json
</pre
  >
</details>

---

## Установка и настройка

<details>
  <summary><strong>1. Установка шрифта JetBrainsMonoNL Nerd Font Mono</strong></summary>
  <br>

```bash
cd ide_configs/JetBrainsMono
sudo ./install_font.sh
```

> Убедитесь, что имя шрифта в настройках IDE и терминала указано точно: `JetBrainsMonoNL Nerd Font Mono`.

</details>

---

<details>
  <summary><strong>2. Установка Fcitx 5 в качестве общесистемного методами ввода</strong></summary>
  <br>

Для **стандартизации** системы ввода и настройти **автопереключения** неанглийских раскладок **при смене режимов** Vim (Normal, Insert, Visual) установите `fcitx5` вместо `ibus`:

```bash
sudo apt update
sudo apt install fcitx5
sudo apt purge ibus
sudo apt autoremove --purge
sudo apt full-upgrade
sudo apt autoclean
```

В настройках системы указать Fcitx 5 как предпочитаемый метод ввода.

> System -> Region & Language -> Manage Installed Languages -> Keyboard input method -> Fcitx 5

Добавить в конец файла `/etc/environment` строки:

```
INPUT_METHOD=fcitx
XMODIFIERS="@im=fcitx"
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
```

Включить автозагрузку при старте системы:

```bash
sudo cp /usr/share/applications/org.fcitx.Fcitx5.desktop /etc/xdg/autostart/
```

Перезагрузить систему.

> Не забудь добавить в Fcitx 5 Configuration нужный метод ввода.

</details>

> Конфиги всех IDE настроеты для работы с Fcitx 5.

---

### 3. Установка и настройка Neovim

Neovim используется как **CLI-редактор** — для просмотра и редактирования **системных** файлов.

**Установка Neovim:**

```bash
cd ide_configs/Neovim/installer
sudo ./install_nvim.sh
```

> Скрипт `remove_nvim.sh` удаляет **только Neovim**, не трогая пользовательские настройки.

**Установка плагинов lazy.nvim и конфигов:**

```bash
cd ide_configs/Neovim
./install_lazy.nvim_plugins.sh
```

Для **классического** поведения `Ctrl+C` и `Ctrl+V` в **Insert** режиме, добавить соответствующие комбинации в настройках сакомого терминала.

> Подробности описаны в файлах `init.lua` и `installer/README`.

---

<details>
  <summary><strong>4. Настройка Sublime Text</strong></summary>
  <br>

Sublime Text используется как GUI-редактор **без Vim-режима** — для просмотра и редактирования **пользовательских** файлов.

> **ОСТОРОЖНО!** Устоновка через `install_sublime_config.sh` заменяет уже существующие настройки.

**Установка конфигурации:**

```bash
cd ide_configs/SublimeText
./install_sublime_config.sh
```

Установятся:

- Макрос для автоперехода на следующую строку при комментировании: `comment_and_next_line.sublime-macro`
- Горячие клавиши: `Default (Linux).sublime-keymap`
- Настройки пакетов: `Package Control.sublime-settings`
- Общие настройки: `Preferences.sublime-settings`
- Настройка общесистемного форматтера: `prettierd_format.sublime-settings` (подразумевается что prettierd установлен в системе)
- Настройка терминала по умолчанию: `Terminal.sublime-settings` (измените на ваш терминал)
- Универсальный Builder: `Terminus.sublime-build` (при желании добавьте секцию для нужного языка)

> Доп. информация — в `SublimeText/REDME`.

</details>

---

### 5. Настройка VSCode

Скопируйте или настройте через интерфейс:

- `settings.json` — основные параметры
- `keybindings.json` — горячие клавиши

> Доп. информация — в `VSCode/REDME`

---

### 6. Настройки IdeaVim для JetBrains IDE

Файл `.ideavimrc` содержит:

- Инструкцию по установке
- Настроки `IdeaVim` для JetBrains IDE
- Пользовательские маппинги

> В настройках IDE выставить межстрочное расстояние **1.05** для редактора и **1.0** для терминала. Это создасть **единсво отступов** во всех средах.

---

## Рекомендации

- Используйте под **Ubuntu с Wayland**, чтобы все скрипты и плагины работали корректно.
- Не забудьте **прочитать** `init.lua` и все `README`.

---

## Лицензия

MIT License © Aleksey Kabkov
