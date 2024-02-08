server {
    listen       80;
    listen  [::]:80;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    location /${externalid-token}/ {
   	proxy_pass 	   http://frontweb/; 
        proxy_redirect     off;
        proxy_set_header   Host $$host;
        proxy_set_header   X-Real-IP $$remote_addr;
        proxy_set_header   X-Forwarded-For $$proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Host $$server_name;
    }

    location /${random-url-db}/ {
   	proxy_pass 	   http://phpmyadmin/; 
        proxy_redirect     off;
        proxy_set_header   Host $$host;
        proxy_set_header   X-Real-IP $$remote_addr;
        proxy_set_header   X-Forwarded-For $$proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Host $$server_name;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
