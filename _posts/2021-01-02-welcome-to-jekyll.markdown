---
layout: post
title:  "Static blog setup"
date:   2021-01-02 23:23:41 -0600
categories: jekyll
---

As my email is bound to this domain, I decided to put at least some
content up, as not to keep the page completely blank.

Setup is quite simple, on my own machine I use [Jekyll
container][jekyll-container] as per their
[documentation][jekyll-container-docs].

I switched the version to 4.1.0 though (4.2.0 which is the latest one
did not work).

The blog itself was initialized by running:
```
docker run --rm \
  --volume="$PWD:/srv/jekyll"  \
  -it jekyll/builder:4.1.0 \
  jekyll new pow.lt
```

and then

```
cd pow.lt
docker run --rm \
  --volume="$PWD:/srv/jekyll"  \
  -it jekyll/builder:4.1.0 \
  jekyll build
```

so `Gemfile.lock` would get populated.

Once I had that down, I had to figure out the GCS stuff, which I did
following [Jekyll on GCS tutorial][jekyll-gcs-tutorial]. It's quite
outdated, as it's from 2015, but pointed me in the right direction.

Once I had the manual publishing going, I pushed the blog to [personal
github repo][pow-github-repo] and started working out the automated
publishing.

I decided to use github actions, so followed [a tutorial on how to
upload to gcs from a github action][gcs-github-action] and [docs from
a Jekyll action that can build, but not
publish][jekyll-build-action].

And here we are...

[jekyll-container]: https://hub.docker.com/r/jekyll/jekyll/
[jekyll-container-docs]: https://github.com/envygeeks/jekyll-docker/blob/master/README.md
[jekyll-gcs-tutorial]: https://jen.run/blog/2015/07/jekyll-google-cloud-storage.html
[pow-github-repo]: https://github.com/ignas/pow.lt
[gcs-github-action]: https://sha.ws/automatic-upload-to-google-cloud-storage-with-github-actions.html
[jekyll-build-action]: https://github.com/marketplace/actions/jekyll-action
