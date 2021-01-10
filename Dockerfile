FROM debian:buster-slim

RUN adduser --disabled-password --home=/var/lib/hacker_bomb --gecos "" --uid=1000 hacker_bomb

COPY hacker_bomb /usr/bin/
COPY entrypoint.sh /usr/bin/entrypoint

WORKDIR /var/lib/hacker_bomb

EXPOSE 8080

ENTRYPOINT ["entrypoint"]