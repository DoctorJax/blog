#!/bin/bash

set -e

printf "\n Updating and publishing site to GitHub \n"

zola build

cp -rf public/* ../doctorjax.github.io/

cd ../doctorjax.github.io/

msg="rebuilding site as of $(date +%m-%d-%Y_%T)"
if [ -n "$*" ]; then
    msg="$*"
fi

git commit -m "$msg"

git push

# Updating blog repo too
cd ../blog/

git add .

git commit -m "$msg"

git push
