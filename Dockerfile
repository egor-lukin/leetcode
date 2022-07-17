FROM ruby:2.7.1-alpine3.12

RUN apk update && \
    apk add --no-cache \
    build-base \
    bash \
    tzdata \
    shared-mime-info

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler:2.1.4
RUN bundle install --jobs 3

COPY . /app

EXPOSE 3000
