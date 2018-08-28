<?php
  $servers = new Datastore();
  $servers->newServer('ldap_pla');
  $servers->setValue('server','host','ldaps://dev.firstrun.cn');
  $servers->setValue('server','port',0);
  $servers->setValue('server','base',array('dc=firstrun,dc=cn'));
  $servers->setValue('login','auth_type','session');
  $servers->setValue('login','bind_id','')
?>