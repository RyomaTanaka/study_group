FROM ruby:2.5.1
ENV LANG C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
    libpq-dev

RUN mkdir /study_group
ENV APP_ROOT /study_group
WORKDIR $APP_ROOT

COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . $APP_ROOT