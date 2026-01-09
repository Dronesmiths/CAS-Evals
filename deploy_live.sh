#!/bin/bash

# Configuration
REPO_PATH="/home1/uycannmy/repositories/CAS-Evals"
WEB_ROOT="/home1/uycannmy/public_html/website_7d06a396"

echo "🚀 Starting Manual Deployment..."
echo "📂 Source: $REPO_PATH"
echo "📂 Dest:   $WEB_ROOT"

# Check if repo exists
if [ ! -d "$REPO_PATH" ]; then
    echo "❌ Error: Repository directory not found at $REPO_PATH"
    exit 1
fi

# Create web root if missing
mkdir -p "$WEB_ROOT"

# Copy files explicitly
echo "📦 Copying files..."

cp -R "$REPO_PATH/images" "$WEB_ROOT/" && echo "  - images copied"
cp -R "$REPO_PATH/css" "$WEB_ROOT/" && echo "  - css copied"
cp -R "$REPO_PATH/js" "$WEB_ROOT/" && echo "  - js copied"
cp -R "$REPO_PATH/services" "$WEB_ROOT/" && echo "  - services copied"
cp -R "$REPO_PATH/locations" "$WEB_ROOT/" && echo "  - locations copied"
cp -R "$REPO_PATH/blog" "$WEB_ROOT/" && echo "  - blog copied"
cp -R "$REPO_PATH/about" "$WEB_ROOT/" && echo "  - about copied"
cp -R "$REPO_PATH/contact" "$WEB_ROOT/" && echo "  - contact copied"
cp -R "$REPO_PATH/privacy" "$WEB_ROOT/" && echo "  - privacy copied"

cp "$REPO_PATH/index.html" "$WEB_ROOT/" && echo "  - index.html copied"
cp "$REPO_PATH/robots.txt" "$WEB_ROOT/" && echo "  - robots.txt copied"
cp "$REPO_PATH/sitemap.xml" "$WEB_ROOT/" && echo "  - sitemap.xml copied"
cp "$REPO_PATH/.htaccess" "$WEB_ROOT/" && echo "  - .htaccess copied"

# Fix permissions
echo "🔒 Fixing permissions..."
find "$WEB_ROOT" -type f -exec chmod 644 {} \;
find "$WEB_ROOT" -type d -exec chmod 755 {} \;

echo "✅ Deployment Process Finished!"
