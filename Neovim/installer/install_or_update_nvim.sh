#!/bin/bash
set -e

ARCHIVE="nvim-linux-x86_64.tar.gz"
TMPDIR=$(mktemp -d)

echo "Получаем ссылку на последний релиз Neovim..."
DOWNLOAD_URL=$(wget -qO- https://api.github.com/repos/neovim/neovim/releases/latest \
  | grep "browser_download_url.*nvim-linux-x86_64.tar.gz" \
  | cut -d '"' -f 4)

if [ -z "$DOWNLOAD_URL" ]; then
  echo "Ошибка: не удалось получить URL для загрузки."
  exit 1
fi

echo "Скачиваем $ARCHIVE..."
wget -O "$ARCHIVE" "$DOWNLOAD_URL"

echo "Распаковка архива $ARCHIVE во временную папку $TMPDIR..."
tar -xzf "$ARCHIVE" -C "$TMPDIR"

NVIM_DIR=$(find "$TMPDIR" -maxdepth 1 -type d -name "nvim*")

if [ -z "$NVIM_DIR" ]; then
  echo "Ошибка: не найден каталог с Neovim после распаковки"
  exit 1
fi

echo "Копирование bin..."
sudo cp -r "$NVIM_DIR/bin/"* /usr/local/bin/

echo "Копирование lib..."
sudo cp -r "$NVIM_DIR/lib/"* /usr/local/lib/

echo "Копирование share..."
sudo cp -r "$NVIM_DIR/share/"* /usr/local/share/

echo "Копирование man..."
if [ -d "$NVIM_DIR/man" ]; then
  sudo cp -r "$NVIM_DIR/man/"* /usr/local/man/
fi

echo "Удаляем временные файлы..."
rm -rf "$TMPDIR" "$ARCHIVE"

echo "Neovim установлен успешно!"
