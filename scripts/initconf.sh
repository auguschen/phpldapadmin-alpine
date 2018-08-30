#!/usr/bin/env sh

echo "init config..."

if [[ -n "$LDAP_HOST" ]]; then
  sed -i "s/setValue('server','host','127.0.0.1')/setValue('server','host','`echo $LDAP_HOST | sed 's#\/#\\\/#g'`')/" /srv/phpLDAPadmin/config/config.php
fi

if [[ -n "$LDAP_SERVERNAME" ]]; then
  sed -i "s/setValue('server','name','My LDAP Server')/setValue('server','name','$LDAP_SERVERNAME')/" /srv/phpLDAPadmin/config/config.php
fi

if [[ -n "$LDAP_PORT" ]]; then
  sed -i "s/setValue('server','port',389/setValue('server','port',${LDAP_PORT}/" /srv/phpLDAPadmin/config/config.php
fi

if [[ -n "$LDAP_BASEDN" ]]; then
  sed -i "s/setValue('server','base',array('')/setValue('server','base',array('${LDAP_BASEDN}')/" /srv/phpLDAPadmin/config/config.php
fi

if [[ -n "$LDAP_AUTHTYPE" ]]; then
  sed -i "s/setValue('login','auth_type','session')/setValue('login','auth_type','${LDAP_AUTHTYPE}')/" /srv/phpLDAPadmin/config/config.php
fi

if [[ -n "$LDAP_BINDID" ]]; then
  sed -i "s/setValue('login','bind_id','')/setValue('login','bind_id','${LDAP_BINDID}')/" /srv/phpLDAPadmin/config/config.php
fi

echo "inited."