# docker-beanstalkd

This is a docker template for running a [Beanstalkd](https://github.com/kr/beanstalkd) server instance on a [Debian Jessie 8.0](https://www.debian.org/releases/jessie).

## Using with docker

```
docker run -d -p 11300:11300 placeloop/beanstalkd
```

## Using with docker-compose

Add this to your  ```docker-compose.yml``` file

```
  beanstalkd:
    image: placeloop/beanstalkd
    container_name: beanstalkd-server
    ports:
      - 11300:11300
    volumes:
      - ./data:/binlog
```

It will start a container and create a shared volume ```./data``` mounted on the container ```/binlog``` folder, allowing message queues to be persistant.

## About beanstalkd

The container run command is starting a verbose instance of beanstalkd listening on port 11300.
The server is persisting message queues in a binlog file stored in ```/binlog``` that you can mount with your host machine.

Here's the beanstalkd server options in case you want to override the start command.

```
Use: ./beanstalkd [OPTIONS]

Options:
 -b DIR   wal directory
 -f MS    fsync at most once every MS milliseconds (use -f0 for "always fsync")
 -F       never fsync (default)
 -l ADDR  listen on address (default is 0.0.0.0)
 -p PORT  listen on port (default is 11300)
 -u USER  become user and group
 -z BYTES set the maximum job size in bytes (default is 65535)
 -s BYTES set the size of each wal file (default is 10485760)
            (will be rounded up to a multiple of 512 bytes)
 -c       compact the binlog (default)
 -n       do not compact the binlog
 -v       show version information
 -V       increase verbosity
 -h       show this help
```