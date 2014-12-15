FROM debian:jessie

ENV GIT_USER "root"
ENV GIT_EMAIL "root@localhost"

RUN apt-get -qq update && \
	apt-get -qq install build-essential git-buildpackage libivykis-dev libcap-dev libgeoip-dev libhiredis-dev libriemann-client-dev dh-autoreconf debhelper dh-systemd flex bison xsltproc docbook-xsl libevtlog-dev libesmtp-dev libnet1-dev libdbi-dev libssl-dev libjson-c-dev  libwrap0-dev autoconf libtool automake vim libglib2.0-dev libmongo-client-dev pkg-config
RUN git config --global user.name $GIT_USER
RUN git config --global user.email $GIT_EMAIL
RUN mkdir /packaging
VOLUME /packaging

WORKDIR /packaging
