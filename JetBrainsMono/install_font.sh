#!/bin/bash

DEST="/usr/local/share/fonts/JetBrainsMono"

# Проверка существования директории назначения
if [ ! -d "$DEST" ]; then
  echo "Создаю директорию $DEST"
  sudo mkdir -p "$DEST"
  sudo chown root:root "$DEST"
  sudo chmod 755 "$DEST"
fi

echo "Копирование файлов в $DEST..."
sudo cp -r . "$DEST"

echo "Применение разрешений и владельцев..."

# Установить владельца и права для директорий
sudo find "$DEST" -type d -exec chown root:root {} \; -exec chmod 755 {} \;

# Установить владельца и права для файлов
sudo find "$DEST" -type f -exec chown root:root {} \; -exec chmod 644 {} \;

echo "Обновление кэша шрифтов..."
sudo fc-cache -f -v

echo "✅ Установка завершена."
