FROM raring-i386
RUN apt-get install -y wget ca-certificates software-properties-common
RUN add-apt-repository -y ppa:richarvey/nodejs
RUN echo deb http://archive.ubuntu.com/ubuntu raring universe >> /etc/apt/sources.list
RUN echo deb http://build.voxoz.in/debian raring main >> /etc/apt/sources.list
RUN wget -q -O - http://build.voxoz.in/key | apt-key add -
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN rm -f erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y erlang-nox build-essential npm git inotify-tools vim ssh supervisor
RUN install -d /var/run/sshd
RUN echo "root:root" | chpasswd
ADD sshd.conf /etc/supervisor/conf.d/sshd.conf
