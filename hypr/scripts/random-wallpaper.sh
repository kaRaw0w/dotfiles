#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers"

set_random_wallpaper() {
    if ! pgrep -x "swww-daemon" > /dev/null; then
        echo "Запускаем swww-daemon..."
        swww-daemon &
        sleep 1
    fi
    
    if [ ! -d "$WALLPAPER_DIR" ]; then
        echo "Ошибка: папка $WALLPAPER_DIR не существует"
        return 1
    fi
    
    local wallpapers=($(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) 2>/dev/null))
    
    if [ ${#wallpapers[@]} -eq 0 ]; then
        echo "В папке $WALLPAPER_DIR не найдено изображений"
        return 1
    fi
    
    local random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"
    
    swww img "$random_wallpaper" --transition-type fade --transition-duration 0.5 --transition-fps 60
}

set_random_wallpaper
