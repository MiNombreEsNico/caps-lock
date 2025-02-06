#!/bin/bash

# Función para obtener el estado de Caps Lock
get_caps_lock_state() {
    xset q | grep "Caps Lock:" | awk '{print $4}'
}

# Estado inicial de Caps Lock
CAPS_STATE=$(get_caps_lock_state)

while true; do
    NEW_CAPS_STATE=$(get_caps_lock_state)
    if [ "$NEW_CAPS_STATE" != "$CAPS_STATE" ]; then
        CAPS_STATE=$NEW_CAPS_STATE
        if [ "$CAPS_STATE" = "on" ]; then
            notify-send "Caps Lock" "Mayúsculas activadas"
        else
            notify-send "Caps Lock" "Mayúsculas desactivadas"
        fi
    fi
    # Espera un momento antes de volver a comprobar
    sleep 0.1
done
