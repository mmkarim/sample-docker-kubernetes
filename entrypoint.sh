#!/bin/bash

set -e

RAILS_ENV=production bundle exec rails db:migrate

exec "$@"
