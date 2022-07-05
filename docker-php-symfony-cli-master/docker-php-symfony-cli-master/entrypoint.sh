#!/bin/sh
echo "starting container 2iTech PHP Symfony Cli"

if [ -z "$GIT_USERNAME" ]; then
  echo 'Container failed to start, pls pass -e GIT_USERNAME="Your real name"'
  exit 1
fi

if [ -z "$GIT_EMAIL" ]; then
  echo 'Container failed to start, pls pass -e GIT_EMAIL="your@gihub.email"'
  exit 1
fi

git config --global user.name "$GIT_USERNAME"

git config --global user.email "$GIT_EMAIL"

exec "$@"