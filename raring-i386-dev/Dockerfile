FROM img.voxoz.in/raring-i386-base

RUN add-apt-repository -y ppa:richarvey/nodejs
RUN apt-get update
RUN apt-get install -y voxoz-erlang build-essential npm git inotify-tools vim ssh supervisor tmux curl lsof strace && rm -rf /var/cache/apt/archives
RUN wget -O /usr/local/bin/rebar https://github.com/rebar/rebar/wiki/rebar && chmod +x /usr/local/bin/rebar
RUN npm install -g uglify-js

EXPOSE 22 8000 8087 8098
CMD ["/usr/bin/setarch", "i386", "/usr/bin/supervisord", "-n"]
