FROM ruby:3.1.1-alpine as dev-build
LABEL maintainer="Joalbert Andrés González <joalbertgonzalez@gmail.com>"
LABEL version="1.0.1"

# Packages needed to get Rails running in Alpine.
ENV BUILD_PACKAGES="build-base" \
    DEV_PACKAGES="tzdata" \
    DB_PACKAGES="postgresql-dev postgresql-client" \
    RUBY_PACKAGES="nodejs"

# -U, --update-cache    Update the repository cache
# and install dependencies
RUN apk add --update-cache \
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $DB_PACKAGES \
    $RUBY_PACKAGES \
    && rm -rf /var/cache/apk/*

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
WORKDIR /myapp
# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile* /myapp/

# Prevent bundler warnings; ensure that the bundler version
# executed is >= that which created Gemfile.lock
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

# Add a script to be executed every time the container starts.
# the entrypoint is a script to fix a Rails-specific issue that
# prevents the server from restarting when a certain server.pid file pre-exists.
COPY /docker-entrypoints/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expose the applications port to the host machine
EXPOSE 3000

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

FROM ruby:3.1.1-alpine as prod-build
LABEL maintainer="Joalbert Andrés González <joalbertgonzalez@gmail.com>"
LABEL version="1.0.1"

# Packages needed to get Rails running in Alpine.
ENV BUILD_PACKAGES="build-base" \
    DEV_PACKAGES="tzdata" \
    DB_PACKAGES="postgresql-dev postgresql-client" \
    RUBY_PACKAGES="nodejs"

# -U, --update-cache    Update the repository cache
# and install dependencies
RUN apk add --update-cache \
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $DB_PACKAGES \
    $RUBY_PACKAGES \
    && rm -rf /var/cache/apk/*

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
WORKDIR /myapp
# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile* /myapp/

# Prevent bundler warnings; ensure that the bundler version
# executed is >= that which created Gemfile.lock
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5 --without development test

# Add a script to be executed every time the container starts.
# the entrypoint is a script to fix a Rails-specific issue that
# prevents the server from restarting when a certain server.pid file pre-exists.
COPY /docker-entrypoints/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expose the applications port to the host machine
EXPOSE 3000

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
