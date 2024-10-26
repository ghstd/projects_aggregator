#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bun install
bundle exec rake assets:clobber
bundle exec rake assets:precompile
bundle exec rake db:migrate