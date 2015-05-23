# XWiki image

Docker image of the XWiki intranet application with expected connection/configuration talking to PostgreSQL container.

Expectations:

* 'xwiki' PostgreSQL database

# Run

Example of Docker Compose configuration:
```
xwiki:
  image: seges/xwiki:6.1
  ports:
    - 8080
  links:
    - yourdb:db
  environment:
    - DB_USERNAME=dbwiki
    - DB_PASSWORD=dbpasswd
```
