#!/bin/bash

find ./charts -maxdepth 2 -type f -name Chart.yaml \
  -print0 \
| xargs -0 -n1 -P8 -I{} sh -c 'helm dependency update "$(dirname "{}")"'

helm unittest charts/*