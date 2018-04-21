FROM ruby:2.4
ENV LANG=C.UTF-8
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      postgresql-client \
      nodejs \
      cmake \
      pkg-config \
      curl \
      libsodium-dev && \
    gem update --system && \
    gem install bundler
WORKDIR /rails-contributors
COPY Gemfile* ./
RUN bundle install -j3
