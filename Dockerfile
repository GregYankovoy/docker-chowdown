FROM gregyankovoy/alpine-base

COPY chowdown.sh /usr/local/bin/chowdown.sh
RUN chmod +x /usr/local/bin/chowdown.sh

RUN wget https://github.com/clarklab/chowdown/archive/gh-pages.zip \
    && gh-pages.zip \
    && rm gh-pages.zip \
    && mv chowdown-gh-pages /opt/app
    && apk add --update --no-cache ruby ruby-json ruby-bigdecimal ruby-webrick ruby-etc libffi \
    && apk add --virtual build-dependencies build-base ruby-dev libffi-dev \
    && gem install jekyll --no-ri --no-rdoc \
    && gem cleanup \
    && apk del build-dependencies

EXPOSE 4000
VOLUME /config

CMD [ "sh", "/usr/local/bin/chowdown.sh" ]
