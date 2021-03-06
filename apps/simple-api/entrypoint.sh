#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

echo 'Managing Database'
rails db:create db:migrate

echo 'Seeding Database'
rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"