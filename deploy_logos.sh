#!/bin/bash

echo "Deploying new quantIQ logos..."

SRC="$HOME/Downloads/quantiq-logos"

# BRAND/ICONS - Favicon and icon sizes
echo "Updating brand/icons/..."
cp "$SRC/icon-32.png" brand/icons/favicon-32.png
cp "$SRC/icon-64.png" brand/icons/favicon.png
cp "$SRC/icon-64.png" brand/icons/icon-64.png
cp "$SRC/icon-192.png" brand/icons/icon-192.png
cp "$SRC/icon-256.png" brand/icons/icon-256.png
cp "$SRC/icon-512.png" brand/icons/icon-512.png
cp "$SRC/icon-4166.png" brand/icons/icon-4166.png
cp "$SRC/icon-white-1000.png" brand/icons/icon-white-512.png

# Generate favicon.ico
if command -v convert &> /dev/null; then
    convert "$SRC/icon-64.png" -define icon:auto-resize=64,48,32,16 brand/icons/favicon.ico
    echo "  ✓ Generated favicon.ico"
else
    echo "  ⚠️  ImageMagick not found - generate favicon.ico at https://favicon.io/favicon-converter/"
fi

# BRAND/LOGOS - Logo variations
echo "Updating brand/logos/..."
cp "$SRC/logo-horizontal-2000.png" brand/logos/logo-horizontal-large.png
cp "$SRC/logo-horizontal-1000.png" brand/logos/logo-horizontal.png
cp "$SRC/logo-horizontal-tagline.png" brand/logos/logo-horizontal-tagline.png
cp "$SRC/logo-stacked-white.png" brand/logos/logo-horizontal-white.png
cp "$SRC/icon-white-1000.png" brand/logos/logo-icon-white.png
cp "$SRC/logo-stacked-white.png" brand/logos/logo-stacked-white.png
cp "$SRC/logo-stacked-1000.png" brand/logos/logo-stacked.png
cp "$SRC/logo-text-white.png" brand/logos/logo-text-white.png

# BRAND/SOCIAL - Social media images
echo "Updating brand/social/..."
cp "$SRC/icon-1024.png" brand/social/og-image.png
cp "$SRC/icon-512.png" brand/social/apple-touch-icon.png

# BRAND/WEB - PWA/mobile icons
echo "Updating brand/web/..."
cp "$SRC/icon-192.png" brand/web/android-chrome-192.png
cp "$SRC/icon-512.png" brand/web/android-chrome-512.png
cp "$SRC/icon-512.png" brand/web/apple-touch-icon.png

# ROOT LEVEL - Main logo files
echo "Updating root files..."
cp "$SRC/logo-horizontal-1000.png" logo.png
cp "$SRC/icon-1024.png" logo-icon.png
cp "$SRC/icon-4166.png" icon-4166.png
cp "$SRC/icon-192.png" icon-192.png

# BLOG - Blog assets
echo "Updating blog/assets/..."
cp "$SRC/logo-horizontal-1000.png" blog/assets/logo-horizontal.png
cp "$SRC/logo-stacked-white.png" blog/assets/logo-horizontal-white.png

# DOCS - Documentation
echo "Updating docs/..."
cp "$SRC/icon-512.png" docs/logo.png
cp "$SRC/icon-64.png" docs/favicon.png

echo ""
echo "✅ Logo deployment complete!"
echo ""
echo "Updated locations:"
echo "  📁 brand/icons/    - 8 icon sizes + favicon.ico"
echo "  📁 brand/logos/    - 8 logo variations"
echo "  📁 brand/social/   - 2 social media images"
echo "  📁 brand/web/      - 3 PWA/mobile icons"
echo "  📁 Root level      - 4 main files"
echo "  📁 blog/assets/    - 2 blog logos"
echo "  📁 docs/           - 2 doc files"
echo ""
echo "Next steps:"
echo "  git status"
echo "  git add ."
echo "  git commit -m 'Update all logos to quantIQ branding'"
echo "  git push origin main"
