#!/bin/bash

set -e

RAILS_ENV=production bundle exec rails db:create db:migrate

exec "$@"
