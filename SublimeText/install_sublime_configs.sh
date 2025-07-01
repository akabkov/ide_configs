#!/bin/bash

# Путь к директории скрипта
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Путь к исходной папке с конфигами
SOURCE_DIR="$SCRIPT_DIR/sublime_configs"

# Папка назначения
TARGET_DIR="$HOME/.config/sublime-text/Packages/User"

# Проверка, существует ли исходная папка
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Исходная папка не найдена: $SOURCE_DIR"
    exit 1
fi

# Создание целевой папки, если её нет
if [ ! -d "$TARGET_DIR" ]; then
    echo "Целевая папка не найдена. Создаю: $TARGET_DIR"
    mkdir -p "$TARGET_DIR"
fi

# Копирование файлов с заменой
echo "Копирую файлы из $SOURCE_DIR → $TARGET_DIR..."
cp -v -r "$SOURCE_DIR"/* "$TARGET_DIR/"

echo "Копирование завершено!"
