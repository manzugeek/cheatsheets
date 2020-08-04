#!/bin/sh

# Author : Marko Koen

echo "Marko Docker cheat sheet"

# Run then delete basic container
docker run --rm ruby:2.6 ruby -e "puts :hello"

# List the running containers, we use:
docker ps

# list all our containers, including stopped ones
docker ps -a

# Dockerfile Example:
FROM ruby:2.6
RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs
COPY . /usr/src/app/ 7
WORKDIR /usr/src/app
RUN bundle install

# Build Docker Image
docker build .
# Build and tag docker image railsapp
docker build -t railsapp .

# Run rails app inside Container based on Image, map port 3000 to port 3000 on local machine 
docker run -p 3000:3000 1eb9d4f1ea42 bin/rails s -b 0.0.0.0 # all IP adresses
# run with tag
docker run -p 3000:3000 railsapp

# Tag a docker image    
docker tag a1df0eddba18 railsapp

# list docker images
docker images

# Remove an image
docker image rm <tag/id>

# With docker-compose.yml file in place, to run container based on image:
docker-compose up

# Stops running containers
docker-compose down

# Check what containers are currently running
docker-compose ps

# Stop all containers in the entire application
docker-compose stop # add <service_name> to terminate a specific service

# Start and restart container
docker-compose start web
docker-compose restart web

# View container logs
docker-compose logs -f web

# Dcoker compose rebuild an image(web in this case)
docker-compose build web

# Remove and free up unnecessary or unused containers/images/any system resources
docker container prune
docker image prune
docker system prune

# T start a Redis server with docker run
docker run --name redis-container redis

# Start Redis server with Compose using docker-compose.yml
docker-compose up -d redis

# Connect to Redis server through compose manually
docker-compose run --rm redis redis-cli -h redis

# List our currently defined networks
docker network ls

# Start entire app - including other services
docker-compose up -d

# Start up database service with docker compose
docker-compose up -d database

# Take containers down
docker-compose down

# Access Rails terminal inside Container
docker-compose exec web bin/rails c

# 