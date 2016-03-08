FROM osixia/openldap:1.1.1
MAINTAINER rok@reciprocitylabs.com
RUN apt-get update && apt-get install -y --force-yes ldapscripts vim

COPY . /ldap-server
WORKDIR /ldap-server

RUN echo -n 'admin' > /etc/ldapscripts/ldapscripts.passwd
RUN cp resources/ldapscripts.conf /etc/ldapscripts/ldapscripts.conf
EXPOSE 389 636
