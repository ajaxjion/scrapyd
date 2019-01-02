# scrapyd

* spiderkeeper

* scrapy

* cron

```
version: '3.4'

x-logging:
  &default-logging
  options:
    max-size: '12m'
    max-file: '5'
  driver: json-file

services:
  scrapyd:
    restart: always
    logging: *default-logging
    image: adrian812/scrapyd
    ports:
      - "6800:6800"
      - "5000:5000"
    volumes:
      - /data/scrapyd:/var/lib/scrapyd
      - ../:/workspace
    environment:
      - TZ=Asia/Shanghai
```