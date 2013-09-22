FROM raring-i386-base

RUN add-apt-repository -y ppa:richarvey/nodejs
RUN apt-get update
RUN apt-get install -y voxoz-erlang build-essential npm git inotify-tools vim ssh supervisor tmux curl lsof strace
RUN wget -O /usr/local/bin/rebar https://github.com/rebar/rebar/wiki/rebar && chmod +x /usr/local/bin/rebar
RUN npm install -g uglify-js
