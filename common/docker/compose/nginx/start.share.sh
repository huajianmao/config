docker run --name share -p 8082:80 -v `pwd`/nginx.conf:/etc/nginx/nginx.conf:ro -v /home/public:/opt/www/files:ro -d nginx
