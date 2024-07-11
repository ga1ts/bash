#!/bin/bash
echo "Проверка наличия зомби-процессов..."
zombie_processes=$(ps aux | awk '$8 ~ /Z/ { print $2, $11 }')
if [ -z "$zombie_processes" ]; then
    echo "Зомби-процессы не найдены."
else
    echo "Найдены зомби-процессы:"
    echo "PID    COMMAND"
    echo "$zombie_processes"
    echo "Попытка убить зомби-процессы..."
    for pid in $(echo "$zombie_processes" | awk '{ print $1 }'); do
        echo "Убийство процесса с PID: $pid"
        kill -9 $pid
        if kill -0 $pid 2>/dev/null; then
            echo "Не удалось убить процесс с PID: $pid"
        else
            echo "Процесс с PID: $pid успешно убит"
        fi
    done
fi
