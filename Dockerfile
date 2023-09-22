# Using an official Ruby runtime as a parent image
FROM ruby:3.0.2

# Set the working directory in the container
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Remove Gemfile.lock to ensure consistent gem installations
RUN rm Gemfile.lock

# Install gems
RUN bundle install

# Copy the application code into the container
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]

