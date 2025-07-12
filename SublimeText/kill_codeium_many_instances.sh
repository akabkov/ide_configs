#!/bin/bash

# Допустимое количество одновременно работающих процессов Codeium Sublime Text
MAX_ALLOWED=2

COUNT=$(pgrep -fc "language_server_linux_x64.download")

if [ "$COUNT" -gt "$MAX_ALLOWED" ]; then
  # Информационное сообщение (можно увидеть в логах cron)
  echo "[CodeiumSublimeText] Слишком много процессов ($COUNT), завершаем лишние..."
  pkill -f language_server_linux_x64.download
fi
