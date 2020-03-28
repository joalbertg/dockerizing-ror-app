# Dockerfile
FROM ruby:2.7-alpine
LABEL maintainer="Joalbert Andrés González <joalbertgonzalez@gmail.com>"
LABEL version="1.0.0"

# Packages needed to get Rails running in Alpine.
ENV BUILD_PACKAGES="build-base" \
    DEV_PACKAGES="tzdata" \
    DB_PACKAGES="postgresql-dev postgresql-client" \
    RUBY_PACKAGES="nodejs"

# -U, --update-cache    Update the repository cache
# and install base packages
RUN apk add --update-cache \
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $DB_PACKAGES \
    $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
ENV INSTALL_PATH /myapp
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock "$INSTALL_PATH/"

# Prevent bundler warnings; ensure that the bundler version
# executed is >= that which created Gemfile.lock
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

COPY . $INSTALL_PATH

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expose the applications port to the host machine
EXPOSE 3000

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

