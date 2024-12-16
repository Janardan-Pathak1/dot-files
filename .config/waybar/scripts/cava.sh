#!/bin/bash

# Ensure cava uses raw output mode (requires editing the cava config)
CONFIG="$HOME/.config/cava/config"

# Check if config exists
if [ ! -f "$CONFIG" ]; then
    echo "{\"text\": \"Cava config not found!\", \"tooltip\": \"Create $CONFIG first.\"}"
    exit 1
fi

# Generate visualization output
while :; do
    # Use raw output mode and display a placeholder visualization
    cava_output=$(cava -p "$CONFIG" 2>/dev/null | head -n 1)
    
    # Fallback if Cava doesn't output anything
    [ -z "$cava_output" ] && cava_output="|| || || || ||"

    # Send visualization to Waybar
    echo "{\"text\": \"$cava_output\", \"tooltip\": \"Audio Visualization\"}"
    sleep 1
done

