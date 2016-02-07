# XWiki image

Docker image of the XWiki intranet application with expected connection/configuration talking to PostgreSQL container.

Expectations:

* 'xwiki' PostgreSQL database

# Run

Example of Docker Compose configuration:
```
xwiki:
  image: seges/xwiki:7.4
  ports:
    - 8080
  links:
    - xwikidb:db
  environment:
    - DB_NAME=xwiki
    - DB_USERNAME=xwiki
    - DB_PASSWORD=dbpasswd

xwikidb:
  image: seges/postgresql:9.4.5
  volumes:
    - /opt/docker/xwiki-db/data:/var/lib/postgresql/data
  environment:
    - DB_NAMES=xwiki
    - DB_USERNAME=xwiki
    - DB_PASSWORD=password
    - DB_USERNAME_ADMIN=xwikiadmin
    - DB_PASSWORD_ADMIN=password2
```
