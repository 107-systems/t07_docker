#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
docker build --pull --tag pika_spark_t07_docker .
