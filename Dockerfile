FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install bundler
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

EXPOSE 3000

CMD ["bundle", "exec", "rails", "db:migrate"]
CMD ["bundle", "exec", "puma", "-t", "5:5", "-w", "1", "-p", "3000", "-e", "production"]
