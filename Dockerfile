FROM nginix:latest
COPY index.html /usr/share/nginix/html/index.html
EXPOSE 80
cmd ["nginix","-g","daemon off;"]

