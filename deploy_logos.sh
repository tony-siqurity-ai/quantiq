#!/bin/bash

echo "Deploying new quantIQ logos..."

SRC="$HOME/Downloads/quantiq-logos"

# HORIZONTAL LOGOS (icon + text)
# Image 8 - Main horizontal logo, high-res
cp "$SRC/logo-horizontal-2000.png" brand/logos/logo-horizontal-large.png

# Image 13 - Horizontal logo, medium size
cp "$SRC/logo-horizontal-1000.png" brand/logos/logo-horizontal.png
cp "$SRC/logo-horizontal-1000.png" blog/assets/logo-horizontal.png
cp "$SRC/logo-horizontal-1000.png" logo.png

# Image 14 - Horizontal logo with tagline
cp "$SRC/logo-horizontal-tagline.png" brand/logos/logo-horizontal-tagline.png

# TEXT ONLY LOGOS (no icon, just text)
# Image 9 - White "quant" + gradient "IQ" (for dark backgrounds)
cp "$SRC/logo-text-white.png" brand/logos/logo-text-white.png

# WHITE/LIGHT VERSIONS (for dark backgrounds)
# Image 11 - White icon only
cp "$SRC/icon-white-1000.png" brand/logos/logo-icon-white.png

# Image 12 - White stacked version (icon + IQ text)
cp "$SRC/logo-stacked-white.png" brand/logos/logo-stacked-white.png
cp "$SRC/logo-stacked-white.png" blog/assets/logo-horizontal-white.png

# STACKED LOGO (icon on top, text below)
# Image 10 - Full color stacked
cp "$SRC/logo-stacked-1000.png" brand/logos/logo-stacked.png

# ICON ONLY (just the orb)
# Image 1 - Extra large (4166x4166)
cp "$SRC/icon-4166.png" icon-4166.png

# Image 2 - Large (1024x1024)
cp "$SRC/icon-1024.png" logo-icon.png

# Image 3 - Medium (512x512)
cp "$SRC/icon-512.png" docs/logo.png

# Image 5 - Small (192x192 - PWA)
cp "$SRC/icon-192.png" icon-192.png

# Image 6 - Another medium size
cp "$SRC/icon-256.png" brand/icons/icon-256.png

# FAVICONS
# Image 4 & 7 - Tiny favicons
cp "$SRC/icon-64.png" brand/icons/favicon.png
cp "$SRC/icon-64.png" docs/favicon.png
cp "$SRC/icon-32.png" brand/icons/favicon-32.png

# Generate .ico file
if command -v convert &> /dev/null; then
    convert "$SRC/icon-64.png" -define icon:auto-resize=64,48,32,16 brand/icons/favicon.ico
else
    echo "⚠️  ImageMagick not found. Generate favicon.ico at: https://favicon.io/favicon-converter/"
fi

echo "✓ Logo deployment complete!"
echo ""
echo "Logo inventory:"
echo "  - Horizontal (icon + text): logo-horizontal-*.png"
echo "  - Text only (for dark bg): logo-text-white.png"
echo "  - Stacked: logo-stacked.png"
echo "  - Icon only: icon-*.png"
echo "  - White versions: *-white.png"
