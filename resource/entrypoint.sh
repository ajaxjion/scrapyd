#!/bin/sh

if [ -f /workspace/crontab.txt ]
then
    echo "crontab file /workspace/crontab.txt"
    crontab /workspace/crontab.txt
else
    echo "Not Cool Beans"
    crontab /crontab.txt
fi

nohup spiderkeeper --no-auth  --database-url=sqlite:////var/lib/scrapyd/dbs/spiderkeeper.db &

scrapyd
