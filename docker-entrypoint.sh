#!/bin/bash
set -e

if [ ! -f Gemfile ]; then
  echo "No Gemfile found!"
  exit 1
fi

bundle install --retry 5 --jobs $(nproc)

exec "$@"
