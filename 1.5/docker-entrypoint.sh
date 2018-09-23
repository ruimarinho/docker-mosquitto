#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for mosquitto"

  set -- mosquitto "$@"
fi

if [ "$1" = "mosquitto" ] || [ "$1" = "mosquitto_sub" ] || [ "$1" = "mosquitto_pub" ]; then
  echo
  exec su-exec mosquitto "$@"
fi

echo
exec "$@"
