#!/bin/bash
set -e

bundle install --path=vendor
npm install
./node_modules/.bin/bower install
./node_modules/.bin/real-favicon generate _assets/img/faviconDescription.json /dev/null .
JEKYLL_ENV=production bundle exec jekyll build --future