FROM selenium/standalone-chrome-debug:latest

USER root

RUN apt-get -y update
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
RUN apt-get -y install nodejs
