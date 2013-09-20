FROM raring-i386
RUN apt-get install -y wget ca-certificates software-properties-common
RUN add-apt-repository -y ppa:richarvey/nodejs
RUN echo deb http://archive.ubuntu.com/ubuntu raring universe >> /etc/apt/sources.list
RUN echo deb http://build.voxoz.in/debian raring main >> /etc/apt/sources.list
RUN wget -q -O - http://build.voxoz.in/key | apt-key add -
RUN apt-get update
RUN apt-get install -y voxoz-erlang build-essential npm git inotify-tools vim ssh supervisor tmux curl lsof strace
RUN wget -O /usr/local/bin/rebar https://github.com/rebar/rebar/wiki/rebar && chmod +x /usr/local/bin/rebar
RUN npm install -g uglify-js
RUN install -d /var/run/sshd
RUN rm -rf /etc/update-motd.d /etc/motd && echo voxoz raring-i386-dev > /etc/motd
RUN echo export LC_CTYPE=C.UTF-8 LC_ALL=C.UTF-8 > /etc/profile.d/voxoz-locale.sh
RUN echo "root:root" | chpasswd
ADD sshd.conf /etc/supervisor/conf.d/sshd.conf
EXPOSE 22
CMD ["/usr/bin/setarch", "i386", "/usr/bin/supervisord", "-n"]
