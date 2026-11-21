FROM nginx:1.31-alpine-slim
COPY public /usr/share/nginx/html
RUN rm /usr/share/nginx/html/.htaccess
