
include:
  - stackstrap.nginx

{% from "stackstrap/nginx/macros.sls" import nginxsite %}

{{ nginxsite("kitchensink.dev", "vagrant", "vagrant",
             template="salt://stackstrap/nginx/files/php-fastcgi.conf",
             cors="*",
             server_name="kitchensink.dev",
             defaults={
                'port': '5000'
             })
}}

# vim: set ft=yaml ts=2 sw=2 sts=2 et ai :
