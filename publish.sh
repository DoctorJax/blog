#!/bin/bash

set -e
set -x

printf "\n Updating and publishing site to GitHub \n"

msg="rebuilding site as of $(date +%m-%d-%Y_%T)"
if [ -n "$*" ]; then
    msg="$*"
fi

zola build

git add .

git commit -m "$msg"

git push

cp -rf public/* ../doctorjax.github.io/

cd ../doctorjax.github.io/

git add .

git commit -m "$msg"

git push
