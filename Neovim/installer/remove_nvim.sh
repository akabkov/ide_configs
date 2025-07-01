#!/bin/bash
set -e

echo "Удаление Neovim..."

# Удаляем бинарники
sudo rm -f /usr/local/bin/nvim

# Удаляем библиотеки Neovim
sudo rm -rf /usr/local/lib/nvim

# Удаляем данные и плагины
sudo rm -rf /usr/local/share/applications/nvim.desktop
sudo rm -rf /usr/local/share/icons/hicolor/128x128/apps/nvim.png
sudo rm -rf /usr/local/share/man/man1/nvim.1
sudo rm -rf /usr/local/share/nvim

# Удаляем man-страницы Neovim
sudo rm -rf /usr/local/man/man1/nvim.1

echo "Neovim удалён из системных папок."
