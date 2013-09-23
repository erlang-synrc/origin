FROM raring-i386-minbase

RUN apt-get install -y wget ca-certificates software-properties-common
RUN echo deb http://archive.ubuntu.com/ubuntu raring universe >> /etc/apt/sources.list
RUN echo deb http://build.voxoz.in/debian raring main >> /etc/apt/sources.list
RUN wget -q -O - http://build.voxoz.in/key | apt-key add -

RUN apt-get update
RUN apt-get install -y git inotify-tools ssh supervisor tmux curl lsof strace

RUN rm -rf /etc/update-motd.d /etc/motd && echo voxoz raring-i386 > /etc/motd
RUN locale-gen en_US en_US.UTF-8
RUN echo ulimit -n 10240 > /etc/profile.d/voxoz-files.sh

# Hack for initctl
# See: https://github.com/dotcloud/docker/issues/1024
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN echo "root:root" | chpasswd
RUN install -d /var/run/sshd
ADD sshd.conf /etc/supervisor/conf.d/sshd.conf
EXPOSE 22 8000 8087 8098
CMD ["/usr/bin/setarch", "i386", "/usr/bin/supervisord", "-n"]
