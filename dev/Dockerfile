FROM $BASE

RUN add-apt-repository -y ppa:richarvey/nodejs
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb && rm -f erlang-solutions_1.0_all.deb
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential npm git inotify-tools vim ssh supervisor tmux curl lsof strace erlang-nox erlang-dev erlang-doc erlang-manpages erlang-dialyzer && rm -rf /var/cache/apt/archives
RUN wget -O /usr/local/bin/rebar https://github.com/rebar/rebar/wiki/rebar && chmod +x /usr/local/bin/rebar
RUN npm install -g uglify-js

CMD ["/usr/bin/supervisord", "-n"]
