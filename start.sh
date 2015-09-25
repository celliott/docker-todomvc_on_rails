#!/bin/bash

set -e
set -u

REPO=${REPO:-''}

# migrate db and run rails server on port 5000
# TODO make RAILS_PORT configurable
cd $REPO && rake db:migrate && ./bin/rails server -p 5000