FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get install -y --no-install-recommends bash curl ca-certificates iproute2 xz-utils bzip2 sudo adduser \
    && rm -rf /var/lib/apt/lists/* \
    && curl -o /bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py

RUN adduser --disabled-password --home / container

USER container
ENV  USER container
ENV HOME /
WORKDIR /

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]