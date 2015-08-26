FROM ruby:2.2.3
MAINTAINER Chris Olstrom <chris@olstrom.com>

VOLUME /srv/gems
EXPOSE 9292

ADD .mirrorrc /root/.gem/.mirrorrc
ADD config.ru /root/.gem/mirror/config.ru
WORKDIR /root/.gem/mirror

CMD ["rackup", "--host", "0.0.0.0"]
