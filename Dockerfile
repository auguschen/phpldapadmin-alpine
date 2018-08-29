FROM alpine:latest

LABEL maintainer="tianhao.chen@gmail.com"

RUN apk add --no-cache php5-fpm php5-ldap php5-gettext php5-xml nginx git \
&& mkdir /scripts && mkdir /run/nginx && cd /srv \
&& git clone -b master https://github.com/leenooks/phpLDAPadmin.git

COPY scripts/config.php /srv/phpLDAPadmin/config/config.php
COPY scripts/entrypoint.sh /scripts/entrypoint.sh
COPY scripts/initconf.sh /scripts/initconf.sh
COPY scripts/default.conf /etc/nginx/conf.d/default.conf

VOLUME [ "/srv/phpLDAPadmin/config", "/etc/nginx" ]

EXPOSE 80 443

ENTRYPOINT [ "sh", "/entrypoint.sh" ]