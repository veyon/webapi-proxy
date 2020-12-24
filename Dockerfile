FROM ubuntu:focal
MAINTAINER Tobias Junghans <tobydox@veyon.io>

RUN \
	apt update && \
	apt -y --no-install-recommends install software-properties-common && \
	add-apt-repository ppa:veyon/stable && \
	apt update && \
	apt -y --no-install-recommends install veyon=4.5.2-1~focal && \
	apt -y --purge remove software-properties-common && \
	apt -y --purge autoremove && \
	apt -y install && \
	apt clean && \
	rm -rf \
		/usr/bin/*apt* \
		/usr/bin/*dpkg* \
		/usr/bin/perl* \
		/usr/bin/veyon-auth-helper \
		/usr/bin/veyon-configurator \
		/usr/bin/veyon-master \
		/usr/bin/veyon-serv* \
		/usr/bin/veyon-worker \
		/usr/lib/apt \
		/usr/lib/dpkg \
		/usr/lib/x86_64-linux-gnu/veyon/*ldap* \
		/usr/lib/x86_64-linux-gnu/veyon/*x11* \
		/usr/lib/x86_64-linux-gnu/dri \
		/usr/lib/x86_64-linux-gnu/libLLVM* \
		/usr/lib/x86_64-linux-gnu/*apt* \
		/usr/lib/x86_64-linux-gnu/*db-5* \
		/usr/lib/x86_64-linux-gnu/*p11* \
		/usr/lib/x86_64-linux-gnu/*gnutls* \
		/usr/lib/x86_64-linux-gnu/*unistring* \
		/usr/share/doc \
		/usr/share/locale \
		/usr/share/man \
		/usr/share/X11 \
		/var/cache \
		/var/lib \
		/var/log \
		/tmp/*

COPY run-veyon-webapi-proxy /usr/bin/

ENTRYPOINT [ "/usr/bin/run-veyon-webapi-proxy" ]
