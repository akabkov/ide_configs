# Vim-like IDE configurations for Ubuntu on Wayland

Цель данного репозитория — по возможности обеспечить **одинаковое Vim-подобное поведение** в средах **Neovim**, **JetBrains IDE**, **Visual Studio Code** и **JupyterLab**. Это позволяет минимизировать переключение контекста между редакторами и работать эффективно в любой среде.

**Репозиторий включает:**

- Шрифты **_JetBrainsMonoNL Nerd Font Mono_** с установочным скриптом
- Инструкцию по переходу на **_Fcitx 5_** как основную систему ввода (вместо `ibus`)
- Конфигурации пользовательских настроек **_JupyterLab_**
- Установщик и конфигурацию для **_Neovim_** и плагинов **_lazy.nvim_**
- Настройки и скрипт их установки для **_Sublime Text_**
- Конфигурационные файлы для **_Visual Studio Code_**
- Настройки IdeaVim для **_JetBrains IDE_** (`.ideavimrc`)

---

## Структура репозитория

<details>
  <summary>📁 ide_configs</summary>
  <pre>
├── JetBrainsMono
│   ├── install_font.sh                         # Скрипт установки шрифта в систему
│   ├── JetBrainsMonoNLNerdFontMono-*.ttf       # Все варианты начертаний JetBrainsMono с NerdFont
│
├── JupyterLab                                  # Конфигурации пользовательских настроек JupyterLab
│   ├── README
│   └── user-settings
│       ├── @axlair
│       │   └── jupyterlab_vim
│       │       └── plugin.jupyterlab-settings  # Настройки расширения vim-мода
│       ├── codeium-jupyter
│       │   └── inline-provider.jupyterlab-settings
│       ├── @jupyterlab
│       │   ├── apputils-extension/notification.jupyterlab-settings
│       │   ├── apputils-extension/themes.jupyterlab-settings
│       │   ├── codemirror-extension/plugin.jupyterlab-settings
│       │   ├── completer-extension/...
│       │   ├── console-extension/tracker.jupyterlab-settings
│       │   ├── docmanager-extension/plugin.jupyterlab-settings
│       │   ├── extensionmanager-extension/plugin.jupyterlab-settings
│       │   ├── filebrowser-extension/browser.jupyterlab-settings
│       │   ├── fileeditor-extension/plugin.jupyterlab-settings
│       │   ├── markdownviewer-extension/plugin.jupyterlab-settings
│       │   ├── notebook-extension/tracker.jupyterlab-settings
│       │   ├── shortcuts-extension/shortcuts.jupyterlab-settings
│       │   └── terminal-extension/plugin.jupyterlab-settings
│       ├── jupyterlab-sql-editor/plugin.jupyterlab-settings
│       ├── @jupyter-lsp/jupyterlab-lsp/completion.jupyterlab-settings
│       ├── jupyter-ruff/plugin.jupyterlab-settings
│       └── @jupyter-widgets/jupyterlab-manager/plugin.jupyterlab-settings
│
├── Neovim
│   ├── init.lua                                # Основной конфиг Neovim с пояснениями по установке
│   ├── install_lazy.nvim_plugins.sh            # Скрипт установки плагинов lazy.nvim
│   ├── installer
│   │   ├── install_or_update_nvim.sh           # Скрипт установки/обновления последней версии Neovim
│   │   ├── README
│   │   └── remove_nvim.sh                      # Удаление установленного Neovim (без очистки конфигурации)
│   └── lua
│       ├── config                              # Основные настройки: keymaps, options, загрузка lazy.nvim
│       │   ├── keymaps.lua
│       │   ├── lazy.lua
│       │   └── options.lua
│       └── plugins                             # Конфигурации отдельных плагинов Neovim
│           ├── comment.lua
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
│   ├── install_sublime_configs.sh              # Скрипт установки всех настроек Sublime Text
│   ├── kill_codeium_many_instances.sh          # Утилита для завершения зависших процессов Codeium
│   ├── README
│   └── sublime_configs                         # Файлы настроек Sublime Text
│       ├── comment_and_next_line.sublime-macro
│       ├── Default (Linux).sublime-keymap
│       ├── LSP.sublime-settings
│       ├── Package Control.sublime-settings
│       ├── Preferences.sublime-settings
│       ├── prettierd_format.sublime-settings
│       ├── sublime-uroborosql-formatter.sublime-settings
│       ├── Terminal.sublime-settings           # ИЗМЕНИТЬ НА ИМЯ ВАШЕГО ТЕРМИНАЛА
│       └── Terminus.sublime-build
│
└── VSCode                                      # Основные настройки: keybindings и settings
    ├── extensions_list.txt
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
sudo bash ./install_font.sh
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

В настройках системы указать `Fcitx 5` как предпочитаемый метод ввода.

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

> Не забудь добавить в `Fcitx 5 Configuration` нужный метод ввода.
> Рекомендуется установить расширение [Input Method Panel](https://extensions.gnome.org/extension/261/kimpanel/).

</details>

> Конфиги всех IDE настроеты для работы с Fcitx 5.

---

### 3. Конфигурация JupyterLab

- Скопируйте содержимое папки `user-settings` в директорию `~/.jupyter/lab/user-settings` с заменой.
- Установите расширения из списка в `JupyterLab/README`.

---

### 4. Установка и настройка Neovim

Neovim используется как **CLI-редактор** — для просмотра и редактирования **системных** файлов.

**Установка Neovim:**

```bash
cd ide_configs/Neovim/installer
sudo bash ./install_or_update_nvim.sh
```

> Скрипт `remove_nvim.sh` удаляет **только Neovim**, не трогая пользовательские настройки.

**Установка плагинов lazy.nvim и конфигов:**

```bash
cd ide_configs/Neovim
bash ./install_lazy.nvim_plugins.sh
```

Для **классического** поведения `Ctrl+C` и `Ctrl+V` в **Insert** режиме, добавить соответствующие комбинации в настройках сакомого терминала.

> Подробности описаны в файлах `init.lua` и `installer/README`.

---

<details>
  <summary><strong>5. Настройка Sublime Text</strong></summary>
  <br>

Sublime Text используется как GUI-редактор **без Vim-режима** — для просмотра и редактирования **пользовательских** файлов.

> **ОСТОРОЖНО!** Устоновка через `install_sublime_config.sh` заменяет уже существующие настройки.

**Установка конфигурации:**

```bash
cd ide_configs/SublimeText
bash ./install_sublime_config.sh
```

Установятся:

- Макрос для автоперехода на следующую строку при комментировании: `comment_and_next_line.sublime-macro`
- Горячие клавиши: `Default (Linux).sublime-keymap`
- Настройки пакетов: `Package Control.sublime-settings`
- Общие настройки: `Preferences.sublime-settings`
- Универсальный Builder через полноценный терминал: `Terminus.sublime-build` (при желании добавьте секцию для нужного языка)
- Конфигурационные файлы для корректной работы LSP и системного форматтера.

> Доп. информация — в `SublimeText/REDME`.

</details>

---

### 6. Настройка Visual Studio Code

Скопируйте или настройте через интерфейс:

- `settings.json` — основные параметры
- `keybindings.json` — горячие клавиши

> Доп. информация — в `VSCode/REDME`

---

### 7. Настройки IdeaVim для JetBrains IDE

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
