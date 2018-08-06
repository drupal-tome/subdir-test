#!/usr/bin/env bash

set -e

drush cr
drush tome:static -l https://tome.fyi/subdir-test
rm -rf gh-pages
git clone git@github.com:drupal-tome/subdir-test.git gh-pages
cd gh-pages
git checkout -B gh-pages
cd ..
rm -rf gh-pages/*
cp -r html/subdir-test/* gh-pages/
cd gh-pages
git add .
git commit -m 'Updating gh-pages site'
git push -u origin gh-pages
