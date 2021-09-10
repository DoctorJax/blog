#!/bin/bash

set -e

printf "\n Updating and publishing site to GitHub \n"

hugo

cd public

git add .

msg="rebuilding site as of $(date +%m-%d-%Y_%T)"
if [ -n "$*" ]; then
    msg="$*"
fi

git commit -m "$msg"

git push origin main

# Updating blog repo too
cd ..

git add .

git commit -m "$msg"

git push origin main
