FROM debian:jessie

RUN apt-get -qq update && \
	apt-get -qq install build-essential git-buildpackage libivykis-dev libmongo-client-dev libcap-dev libgeoip-dev libhiredis-dev libriemann-client-dev dh-autoreconf debhelper dh-systemd flex bison xsltproc docbook-xsl libevtlog-dev libesmtp-dev libnet1-dev libdbi-dev libssl-dev libmongo-client-dev libjson-c-dev  libwrap0-dev
RUN mkdir /packaging
VOLUME /packaging

WORKDIR /packaging
