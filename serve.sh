#!/bin/bash
set -e
JEKYLL_VERSION=4.1.0
docker run --rm -p 4000:4000 \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/builder:$JEKYLL_VERSION \
  jekyll serve --incremental
