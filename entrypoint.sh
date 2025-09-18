#!/bin/sh -l

# Get the HTML file argument
HTML_FILE="$1"

# Copy the provided HTML file to the Nginx directory
cp "/github/workspace/$HTML_FILE" /usr/share/nginx/html/index.html

# Start the Nginx server
nginx -g "daemon off;"