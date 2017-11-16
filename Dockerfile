FROM ruby:2.4.1
LABEL maintainer 'tackeyy'

# Set environment variables
ENV LANG C.UTF-8
ENV ROOT_PATH /blog

# Install essential libraries
RUN apt-get update && apt-get install -y build-essential libpq-dev apt-utils && \
    apt-get install -y nginx

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install nodejs

# Install yarn
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Nginx
ADD nginx.conf /etc/nginx/sites-available/blog.conf
RUN rm -f /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf

# Move to root
RUN mkdir $ROOT_PATH
WORKDIR $ROOT_PATH

# Bundle install
ADD Gemfile $ROOT_PATH/Gemfile
ADD Gemfile.lock $ROOT_PATH/Gemfile.lock
RUN bundle install

# Install foreman
RUN gem install foreman

ADD . $ROOT_PATH
