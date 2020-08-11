#!/bin/sh

# Author : Marko Koen

echo "Marko Git cheat sheet"

# Create and checkout a branch
git checkout -b <branchname>

# Push from branch to master
git push origin branch:master

# Pushing to master -> staging -> production (when on master)
git add .
git commit -m "message"
git push origin master
git push origin master:staging

# switch to branch then
git pull origin master


# Heroku
heroku login
heroku git:remote -a drivernotify
git push heroku master

# webpacker issue
had to change to 3.5 and add webpacker and react then build