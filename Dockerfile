######################################################################
######################################################################
### Dockerfile for Beanstalkd server on Debian 8
######################################################################
######################################################################

# Start from a Debian Jessie 8.7
FROM debian:jessie
MAINTAINER Hugo Lafitte <hugo@placeloop.com>

######################################################################
#### INSTALL SYSTEM DEPENDANCIES
######################################################################

# Install tools
RUN apt-get update \
  && echo 'Acquire::Retries "5";' > /etc/apt/apt.conf.d/mirror-retry \
  && apt-get -y install curl build-essential\ 
  && apt-get clean
  
######################################################################
#### SETUP BEANSTALKD
######################################################################

RUN curl -sL https://github.com/kr/beanstalkd/archive/v1.10.tar.gz | tar xvz -C /tmp

RUN cd /tmp/beanstalkd-1.10 \
  && make \
  && make install

######################################################################
#### RUN CONFIGURATION
######################################################################

VOLUME ["/binlog"]
EXPOSE 11300
CMD ["beanstalkd", "-V", "-p", "11300", "-b", "/binlog"]