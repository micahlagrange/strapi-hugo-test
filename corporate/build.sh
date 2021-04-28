#!/bin/bash

set -ex

cd /home/ubuntu/strapi-hugo-test/corporate/

git pull

hugo --config staging.config.toml -D --ignoreCache

aws s3 rm --recursive s3://webscale-strapi-generated/
aws s3 sync ./public/ s3://webscale-strapi-generated/

