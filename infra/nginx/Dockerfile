FROM nginx:latest

COPY default.conf /etc/nginx/conf.d

RUN apt update && apt upgrade -y
RUN apt install certbot python3-certbot-nginx -y