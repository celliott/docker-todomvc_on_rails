#!/bin/bash

set -e
set -u

cd /todomvc_on_rails && rake db:migrate && ./bin/rails server -p 5000