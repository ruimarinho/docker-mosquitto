# ruimarinho/mosquitto

A mosquitto docker image.

[![build status][travis-image]][travis-url]
[![ruimarinho/mosquitto][docker-pulls-image]][docker-hub-url] [![ruimarinho/mosquitto][docker-stars-image]][docker-hub-url] [![ruimarinho/mosquitto][docker-size-image]][docker-hub-url] [![ruimarinho/mosquitto][docker-layers-image]][docker-hub-url]

## Supported tags and respective `Dockerfile` links

- `1.5.1`, `1.5`, `latest` ([1.5/Dockerfile](https://github.com/ruimarinho/docker-mosquitto/blob/master/1.5/Dockerfile))
- `1.4.15`, `1.4` ([1.4/Dockerfile](https://github.com/ruimarinho/docker-mosquitto/blob/master/1.4/Dockerfile))

This image will be automatically updated whenever there is an update to the base image (`alpine`).

## What is mosquitto?

_from [eclipse/mosquitto](https://github.com/eclipse/mosquitto):_

Mosquitto is an open source implementation of a server for version 3.1 and 3.1.1 of the MQTT protocol. It also includes a C and C++ client library, and the mosquitto_pub and mosquitto_sub utilities for publishing and subscribing.

_from [mqtt.org](http://mqtt.org):_

MQTT is a machine-to-machine (M2M)/"Internet of Things" connectivity protocol. It was designed as an extremely lightweight publish/subscribe messaging transport. It is useful for connections with remote locations where a small code footprint is required and/or network bandwidth is at a premium. It is also ideal for mobile applications because of its small size, low power usage, minimised data packets, and efficient distribution of information to one or many receivers.

## Usage

### How to use this image

This image contains the server binary from the `mosquitto` project and client utilities such as `mosquitto_pub` and `mosquitto_sub` for publishing and subscribing.

```sh
❯ docker run --rm -it ruimarinho/mosquitto
```

By default, the `mosquitto` server will run as user `mosquitto` for security reasons and on the default port `1883`.

#### Using a custom config

The default `/etc/mosquitto` is read by the `mosquitto` server so you can map a host volume to customize it:

```sh
❯ docker run \
  -p 1883:1883 \
  -p 9001:9001 \
  -v /volume1/applications/mosquitto:/etc/mosquitto \
  -d \
  mosquitto -c /etc/mosquitto/mosquitto.conf -v
```

### Running mosquitto client utilities

Run a test server:

```sh
❯ docker run --rm -it \
  --name mosquitto-server \
  ruimarinho/mosquitto
```

#### mosquitto_sub

`mosquitto_sub` is an mqtt client that subscribes to a single topic and prints all the messages it receives.

```sh
❯ docker run --rm -it \
  --link mosquitto-server \
  ruimarinho/mosquitto mosquitto_sub -h mosquitto-server -t '#'
```

#### mosquitto_pub

`mosquitto_pub` is an mqtt client that publishes a message on a single topic and exits.

```sh
❯ docker run --rm -it \
  --link mosquitto-server \
  ruimarinho/mosquitto mosquitto_pub -h mosquitto-server -t home-assistant/switch/1/on -m "Switch is ON"
```
## Supported Docker versions

This image is officially supported on Docker version 1.12, with support for older versions provided on a best-effort basis.

## License

[License information](https://github.com/eclipse/mosquitto/blob/master/LICENSE.txt) for the software contained in this image.

[License information](https://github.com/ruimarinho/docker-mosquitto/blob/master/LICENSE) for the [ruimarinho/docker-mosquitto][docker-hub-url] docker project.

[docker-hub-url]: https://hub.docker.com/r/ruimarinho/mosquitto
[docker-layers-image]: https://img.shields.io/imagelayers/layers/ruimarinho/mosquitto/latest.svg?style=flat-square
[docker-pulls-image]: https://img.shields.io/docker/pulls/ruimarinho/mosquitto.svg?style=flat-square
[docker-size-image]: https://img.shields.io/imagelayers/image-size/ruimarinho/mosquitto/latest.svg?style=flat-square
[docker-stars-image]: https://img.shields.io/docker/stars/ruimarinho/mosquitto.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/ruimarinho/docker-mosquitto.svg?style=flat-square
[travis-url]: https://travis-ci.org/ruimarinho/docker-mosquitto
