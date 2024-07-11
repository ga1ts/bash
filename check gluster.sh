#!/bin/bash

SERVICE="glusterfs-server"
echo "Проверка состояния службы $SERVICE..."
if systemctl is-active --quiet $SERVICE; then
    echo "Служба $SERVICE уже запущена."
else
    echo "Служба $SERVICE не запущена. Запуск службы..."
    systemctl start $SERVICE
    if systemctl is-active --quiet $SERVICE; then
        echo "Служба $SERVICE успешно запущена."
    else
        echo "Не удалось запустить службу $SERVICE. Проверьте логи для получения дополнительной информации."
    fi
fi