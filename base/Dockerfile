FROM $BASE

# this forces dpkg not to call sync() after package extraction
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget ca-certificates software-properties-common && rm -rf /var/cache/apt/archives
RUN echo deb http://archive.ubuntu.com/ubuntu $RELEASE universe >> /etc/apt/sources.list
#RUN echo deb http://build.voxoz.in/debian $RELEASE main >> /etc/apt/sources.list
RUN wget -q -O - http://build.voxoz.in/key | apt-key add -

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y inotify-tools ssh supervisor tmux curl lsof strace && rm -rf /var/cache/apt/archives

RUN rm -rf /etc/update-motd.d /etc/motd && echo voxoz $RELEASE-$ARCH $VERSION > /etc/motd && echo -n > /etc/legal
RUN locale-gen en_US en_US.UTF-8
RUN echo ulimit -n 4096 > /etc/profile.d/voxoz-files.sh

# Hack for initctl
# See: https://github.com/dotcloud/docker/issues/1024
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN echo "root:root" | chpasswd
RUN install -d /var/run/sshd
ADD sshd.conf /etc/supervisor/conf.d/sshd.conf
EXPOSE 22 4369 6000 6001 6002 6003 6004 6005 6006 6007 6008 6009 6010 8000 8087 8098 8099
CMD ["/usr/bin/supervisord", "-n"]
