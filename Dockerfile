FROM ruby:2.4-alpine

# LANG as recommended in the Encoding section of https://hub.docker.com/_/ruby/.
ENV LANG C.UTF-8
ENV PS1 '\w\$ '
ENV BUNDLE_JOBS 4

# openssh-client is handy to check SSH access from within the container.
# curl is used in deployments.
# cmake is needed to compile rugged.
# git is used by the application itself.
# tzdata is needed by the TZinfo gem.
RUN apk --no-cache add --update \
  build-base \
  bash \
  openssh-client \
  cmake \
  curl \
  git \
  postgresql-client \
  postgresql-dev \
  tzdata \
  nodejs

RUN gem update --system && gem install bundler -N

WORKDIR /rails-contributors
