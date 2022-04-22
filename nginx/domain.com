 #cat /etc/nginx/sites-available/domain.com(rome.tk)

server {
#        listen 80;
#        listen [::]:80;

        listen [::]:443 ssl ipv6only=on;
        listen 443 ssl;

        server_name rome.tk www.rome.tk;
        root /var/www/rome.tk;
        index index.html;

        location / {
                try_files $uri $uri/ =404;
        }

        ssl_certificate /etc/nginx/certs/rome.tk/cert.pem;
        ssl_certificate_key /etc/nginx/certs/rome.tk/key.pem;

        ssl_session_timeout 5m;
        ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers on;
}

#server {
#    listen 80;
#    server_name rome.tk;
#    rewrite ^(.*)$ https://rome.tk:443/$1 permanent;// 把http的域名请求转成https
#}
