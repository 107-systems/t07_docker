#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root."
  exit 1
fi

if ! [ -e /sys/class/net/can0 ]; then
    sudo ./setup_slcan.sh --remove-all --basename can --speed-code 5 /dev/serial/by-id/usb-Zubax*Babel*
fi

docker run -it \
   -u 0 \
   --privileged \
   --network host \
   pika_spark_t07_docker
