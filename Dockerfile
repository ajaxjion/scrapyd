FROM vimagick/scrapyd:py3

RUN apt-get update -y && apt-get install -y cron

RUN pip install bs4 sqlitedict spiderkeeper

RUN update-rc.d cron defaults

COPY resource/scrapyd.conf /etc/scrapyd/
COPY resource/entrypoint.sh /entrypoint.sh
COPY resource/crontab.txt /crontab.txt 
RUN chmod +x /entrypoint.sh

VOLUME /workspace
WORKDIR /workspace

EXPOSE 5000

ENTRYPOINT /entrypoint.sh
