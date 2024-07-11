#!/bin/bash
PROCESSES=("apache2" "mysqld" "sshd")
LOGFILE="/var/log/process_monitor.log"
INTERVAL=300
check_processes() {
    echo "Проверка процессов: $(date)" >> $LOGFILE
    for PROCESS in "${PROCESSES[@]}"; do
        if pgrep -x "$PROCESS" > /dev/null; then
            echo "Процесс $PROCESS работает" >> $LOGFILE
        else
            echo "Процесс $PROCESS не найден" >> $LOGFILE
        fi
    done
    echo "-----------------------------" >> $LOGFILE
}
while true; do
    check_processes
    sleep $INTERVAL
done
