# ldap-test-server

This repo serves as a test LDAP server so that you quickly have a server up and ready for testing an LDAP authentication against it.

# Run

    # run new server
    docker build -t ldap-server .
    docker run --name ldap-server -p 389:389 ldap-server
    # configure LDAP database
    docker exec -it ldap-server /ldap-server/bin/openldap-additional-config.sh

# Explore

If you'd like to explore the LDAP database you currently have, you can run `phpldapadmin`:

    docker run -p 6443:443 --name phpldapadmin-service --hostname phpldapadmin-service --link ldap-server:ldap-host --env PHPLDAPADMIN\_LDAP\_HOSTS=ldap-host --detach osixia/phpldapadmin:0.6.8

Open up [localhost:6443](https://localhost:6443/) and login using `cn=admin,dc=example,dc=org` for username and `admin` for password.

# Sample Python

Change the host in the script below and run it in Python when you've `pip install ldap3`.

    import ldap3
    import ssl
    
    from ldap3 import Server, Connection, ALL, NTLM, Tls
    
    host = '192.168.99.100'
    
    server = Server(host, use_ssl=False, get_info=ALL)
    conn = Connection(server, 'cn=admin, dc=example, dc=org', 'admin', auto_bind=True)
    conn.search(search_base="dc=example,dc=org", search_scope=ldap3.SUBTREE, search_filter="(&(objectClass=posixGroup)(cn={})(memberuid={}))".    format("qa", "klemen"))
