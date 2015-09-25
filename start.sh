#!/bin/bash

set -e
set -u

# migrade db and run rails server on port 5000
cd /todomvc_on_rails && rake db:migrate && ./bin/rails server -p 5000
