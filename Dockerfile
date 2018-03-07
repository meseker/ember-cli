FROM node:4.7.2
MAINTAINER Meseker Yohannes <myohannes@aurorasolar.com>

# Note: npm is v2.15.11
RUN \
  npm install -g ember-cli@0.2.7 &&\
    npm install -g bower@1.7.9 &&\
      npm install -g phantomjs@2.1.7

# install watchman
# Note: See the README.md to find out how to increase the
# fs.inotify.max_user_watches value so that watchman will 
# work better with ember projects.
RUN \
  git clone https://github.com/facebook/watchman.git &&\
    cd watchman &&\
      git checkout v3.5.0 &&\
        ./autogen.sh &&\
          ./configure &&\
            make &&\
              make install

RUN echo '{ "allow_root": true }' > /root/.bowerrc
