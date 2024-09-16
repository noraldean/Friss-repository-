#!/bin/bash

# التحقق من استجابة الجهاز عبر ping
ping_host() {
    if ping -c 1 "$1" &> /dev/null; then
        echo "Host $1 is reachable."
    else
        echo "Host $1 is not reachable."
        exit 1
    fi
}

# وظيفة إضافية يمكن أن تضاف هنا
check_service() {
    echo "Checking service on port $2..."
    timeout 1 bash -c "echo > /dev/tcp/$1/$2" 2>/dev/null && echo "Service running on port $2" || echo "No service on port $2"
}
