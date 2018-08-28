FROM alpine:latest

LABEL maintainer="tianhao.chen@gmail.com"

RUN apk add --no-cache php5-fpm php5-ldap php5-gettext php5-xml nginx git \
&& mkdir /run/nginx && cd /srv \
&& git clone -b master https://github.com/leenooks/phpLDAPadmin.git 
# \
# && cp /srv/phpLDAPadmin/config/config.php.example /srv/phpLDAPadmin/config/config.php

COPY script/config.php /srv/phpLDAPadmin/config/config.php
COPY script/entrypoint.sh /entrypoint.sh
COPY script/default.conf /etc/nginx/conf.d/default.conf

VOLUME [ "/srv/phpLDAPadmin/config" ]

EXPOSE 80 443

ENTRYPOINT [ "sh", "/entrypoint.sh" ]