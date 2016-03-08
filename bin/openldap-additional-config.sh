#!/usr/bin/env bash

ldapadd -h 127.0.0.1 -x -w admin -D "cn=admin,dc=example,dc=org" -f /ldap-server/resources/ldifs/groups.ldif
ldapadd -h 127.0.0.1 -x -w admin -D "cn=admin,dc=example,dc=org" -f /ldap-server/resources/ldifs/users.ldif
ldapaddgroup qa
ldapaddgroup admins

# add users
ldapadduser klemen qa
ldapaddusertogroup klemen qa
ldapsetpasswd klemen klemen1

ldapadduser kostya qa
ldapaddusertogroup kostya qa
ldapsetpasswd kostya kostya1

ldapadduser admine admins
ldapaddusertogroup admine admins
ldapsetpasswd admine admine1
