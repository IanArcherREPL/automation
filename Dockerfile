FROM selenium/standalone-firefox:latest

USER root

RUN apt-get -y update
RUN sudo apt-get -y install autoconf automake libusb-dev libusb-1.0-0-dev libplist-dev libplist++-dev usbmuxd libtool libimobiledevice-dev libssl-dev git-all

RUN git clone https://github.com/google/ios-webkit-debug-proxy.git
WORKDIR ios-webkit-debug-proxy
RUN ls
RUN git checkout v1.8.5
RUN ./autogen.sh
RUN make
RUN sudo make install
