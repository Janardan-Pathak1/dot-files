#!/bin/bash

# Temp file paths
SCREENSHOT="/tmp/screenshot.png"

# Take a screenshot of the selected area and perform OCR in one step
grim -g "$(slurp)" "$SCREENSHOT" && tesseract "$SCREENSHOT" - -l eng | wl-copy

# Clean up
rm -f "$SCREENSHOT"

