<a href="https://107-systems.org/"><img align="right" src="https://raw.githubusercontent.com/107-systems/.github/main/logo/107-systems.png" width="15%"></a>
:floppy_disk: `t07_docker`
=========================
[![Spell Check status](https://github.com/107-systems/t07_docker/actions/workflows/spell-check.yml/badge.svg)](https://github.com/107-systems/t07_docker/actions/workflows/spell-check.yml)

Dockerfile and scripts to run the required [T07](https://github.com/107-systems/T07) control software on the [Pika Spark](https://pika-spark.io/).

#### How-to-run on [Pika Spark](https://pika-spark.io/)
```bash
./docker-build.sh
sudo ./docker-run-pika-spark.sh [t07.py | t07_4wd.py | t07_tracked.py]
```

#### How-to-run on Raspberry Pi via Zubax Babel
```bash
./docker-build.sh
sudo ./docker-run-babel.sh [t07.py | t07_4wd.py | t07_tracked.py]
```