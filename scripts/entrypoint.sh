#!/usr/bin/env sh

if [ ! -f /.inited ]; then
  sh /initconf.sh && touch /.inited
fi

php-fpm5 -D && nginx -g "daemon off;"