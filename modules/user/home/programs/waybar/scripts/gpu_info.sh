#!/bin/sh

# Run radeontop for 1 second and capture the output
gpu_info=$(timeout 1 radeontop --dump - 2>/dev/null | tail -n 1)

# Extract GPU usage and VRAM usage
gpu_usage=$(echo "$gpu_info" | awk '/gpu/ {print $2}' | sed 's/%//')
vram_usage=$(echo "$gpu_info" | awk '/vram/ {print $2}' | sed 's/%//')

# Get GPU name using lspci
gpu_name=$(lspci | grep -i vga | awk -F': ' '{print $2}')

# Display all GPU info (for on-click)
all_info=$(echo "$gpu_info" | tr '\n' ' ')

# Output for Waybar
case $1 in
    "usage")
        echo "$gpu_usage%  $vram_usage% "
        ;;
    "name")
        echo "$gpu_name"
        ;;
    "all")
        echo "$all_info"
        ;;
    *)
        echo "$gpu_usage%  $vram_usage% "
        ;;
esac