#!/bin/bash

cd /build
bundle install
bundle exec jekyll serve --watch --livereload --host 0.0.0.0