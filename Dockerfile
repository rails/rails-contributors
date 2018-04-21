FROM ruby:2.4

# LANG as recommended in the Encoding section of https://hub.docker.com/_/ruby/.
ENV LANG C.UTF-8
ENV PS1 '\w\$ '
ENV BUNDLE_JOBS 4

# git is used by the application itself.
# cmake is needed to compile rugged.
# tzdata is needed by the TZinfo gem.
RUN apk --no-cache add --update \
  build-base \
  bash \
  git \
  postgresql-client \
  postgresql-dev \
  cmake \
  tzdata \
  nodejs

RUN gem update --system && gem install bundler -N

WORKDIR /rails-contributors
