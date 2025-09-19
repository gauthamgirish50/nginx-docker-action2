
#!/bin/sh

set -e

echo "[Entrypoint] Starting Nginx Docker Action"

# Get the HTML file argument
HTML_FILE="$1"
if [ -z "$HTML_FILE" ]; then
	echo "[Error] No HTML file argument provided."
	exit 1
fi

if [ ! -f "/github/workspace/$HTML_FILE" ]; then
	echo "[Error] HTML file '/github/workspace/$HTML_FILE' does not exist."
	exit 1
fi

echo "[Entrypoint] Copying $HTML_FILE to /usr/share/nginx/html/index.html"
cp "/github/workspace/$HTML_FILE" /usr/share/nginx/html/index.html

echo "[Entrypoint] Starting Nginx server..."
nginx -g "daemon off;"