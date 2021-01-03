#!/bin/bash
set -e
JEKYLL_VERSION=4.1.0
docker run --rm -p 4000:4000 \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/builder:$JEKYLL_VERSION \
  jekyll build
gcloud config set account ignas.mikalajunas@gmail.com
gsutil -m rsync -d -r ./_site gs://pow.lt
