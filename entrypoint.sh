#!/bin/bash
# This su and chown stuff is needed because Docker is still ugly
# https://github.com/moby/moby/issues/2259

set -e

chown -R proxyu:proxyu ~proxyu

COMMAND="$@"
if [ -z "$COMMAND" ]; then
  COMMAND="hacker_bomb"
fi

exec su -l -c "$COMMAND" hacker_bomb
