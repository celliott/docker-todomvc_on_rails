# Dockerfile for docker-todomvc_on_rails
# modeled from https://github.com/docker-library/rails

FROM ruby:2.0.0

# install dependencies
RUN apt-get update
RUN apt-get install -y nodejs mysql-client postgresql-client sqlite3

# install rails
ENV RAILS_VERSION 4.0.0.rc1
RUN gem install rails --version "$RAILS_VERSION"

# add app and run bundle install
ADD ./build/todomvc_on_rails /todomvc_on_rails
RUN cd todomvc_on_rails && bundle install

# add start.sh and make executable
ADD ./start.sh /start.sh
RUN chmod +x /start.sh 

# run start.sh; which runs migrations and starts rails app
CMD /start.sh
