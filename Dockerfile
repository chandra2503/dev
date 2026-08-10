FROM nginx:latest

COPY index.html /usr/share/nginx/html/index.html

COPY shiva.jpg /usr/share/nginx/html/shiva.jpg


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

