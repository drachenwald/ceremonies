FROM nginx:1.31-alpine-slim
COPY --exclude=.htaccess public /usr/share/nginx/html
