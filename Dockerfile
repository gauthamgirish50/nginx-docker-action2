
# Use the official Nginx image
FROM nginx:latest

# Create entrypoint.sh inside the container to avoid encoding issues
RUN echo '#!/bin/sh\nset -e\necho "[Entrypoint] Starting Nginx Docker Action"\nHTML_FILE="$1"\nif [ -z "$HTML_FILE" ]; then\n  echo "[Error] No HTML file argument provided."\n  exit 1\nfi\nif [ ! -f "/github/workspace/$HTML_FILE" ]; then\n  echo "[Error] HTML file /github/workspace/$HTML_FILE does not exist."\n  exit 1\nfi\necho "[Entrypoint] Copying $HTML_FILE to /usr/share/nginx/html/index.html"\ncp "/github/workspace/$HTML_FILE" /usr/share/nginx/html/index.html\necho "[Entrypoint] Starting Nginx server..."\nnginx -g "daemon off;"' > /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh

# Copy the HTML file to the Nginx container
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80