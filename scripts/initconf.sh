#!/usr/bin/env sh

echo "init config..."

if [[ -n "$LDAP_HOST" ]]; then
  sed -i "s/setValue('server','host','127.0.0.1')/setValue('server','host','`echo $LDAP_HOST | sed 's#\/#\\\/#g'`')/" /srv/phpLDAPadmin/config/config.php
fi

if [[ -n "$LDAP_PORT" ]]; then
  sed -i "s/setValue('server','port',389/setValue('server','port',${LDAP_PORT}/" /srv/phpLDAPadmin/config/config.php
fi

if [[ -n "$BASE_DN" ]]; then
  sed -i "s/setValue('server','base',array('')/setValue('server','base',array('${LDAP_BASEDN}')/" /srv/phpLDAPadmin/config/config.php
fi

if [[ -n "$LDAP_AUTH_TYPE" ]]; then
  sed -i "s/setValue('login','auth_type','session')/setValue('login','auth_type','${LDAP_AUTH_TYPE}')/" /srv/phpLDAPadmin/config/config.php
fi

if [[ -n "$LDAP_BIND_ID" ]]; then
  sed -i "s/setValue('login','bind_id','')/setValue('login','bind_id','${LDAP_BIND_ID}')/" /srv/phpLDAPadmin/config/config.php
fi

echo "inited."