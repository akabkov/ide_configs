#!/bin/bash

# Путь к конфигурации Neovim
TARGET_DIR="$HOME/.config/nvim"

# Создание целевой папки, если не существует
if [ ! -d "$TARGET_DIR" ]; then
    echo "Создаю папку: $TARGET_DIR"
    mkdir -p "$TARGET_DIR"
fi

# Копирование init.lua
if [ -f "./init.lua" ]; then
    echo "Копирую init.lua → $TARGET_DIR/"
    cp -v ./init.lua "$TARGET_DIR/"
else
    echo "Файл init.lua не найден в текущей папке"
fi

# Копирование папки lua
if [ -d "./lua" ]; then
    echo "Копирую папку lua/ → $TARGET_DIR/"
    cp -v -r ./lua "$TARGET_DIR/"
else
    echo "Папка lua/ не найдена в текущей папке"
fi

echo "Конфигурация Neovim установлена!"
