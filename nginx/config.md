ps aux | grep nginx

# /usr/sbin/nginx -g daemon on; master_process on;

/usr/sbin/nginx -t

#nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
#nginx: configuration file /etc/nginx/nginx.conf test is successful

cat  /etc/nginx/nginx.conf

http {
      user www-data;
      include /etc/nginx/modules-enabled/*.conf;
      
      # Virtual Host Configs
      include /etc/nginx/conf.d/*.conf;
      include /etc/nginx/sites-enabled/*;

      server {
        listen 80;
        server_name romepeng.tk;
        root /var/www/html;
        index index.html;

        location / {
                try_files $uri $uri/ =404;
        }

        rewrite ^(.*)$ https://$host$1 permanent;
}

      server {
        listen   443 ssl;
        server_name romepeng.tk;
        ssl_certificate /etc/nginx/cf-cert/public.pem;
        ssl_certificate_key /etc/nginx/cf-cert/private.key;
        ssl_session_cache  shared:SSL:1m;
        ssl_session_timeout 5m;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

        root /var/www/html;

        index index.html;

        location / {
                try_files $uri $uri/ =404;
        }

}
}
