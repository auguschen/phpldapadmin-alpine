#!/usr/bin/env sh

if [ ! -f /.inited ]; then
  sh /scripts/initconf.sh && touch /.inited
fi

php-fpm5 -D && nginx -g "daemon off;"