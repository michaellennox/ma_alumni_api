FROM elixir:1.3.2-slim

RUN apt-get update \
      && apt-get install -qq -y --fix-missing --no-install-recommends \
        build-essential \
        libpq-dev \
        postgresql-client-9.4 \
      && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /usr/src/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD . $APP_HOME

RUN mix local.hex --force
RUN mix deps.get --force
RUN mix local.rebar --force
