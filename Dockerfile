FROM nginx:latest
COPY shiva.jpg /usr/share/nginx/html/shiva.jpg
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

