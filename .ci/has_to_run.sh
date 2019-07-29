#!/bin/bash

set +e

if [[ -z "$FRAMEWORK" ]]; then
  STRING_TO_CHECK="$LANGUAGE/"
else
  STRING_TO_CHECK="$FRAMEWORK/"
fi

# List of updated files
git diff ${TRAVIS_COMMIT_RANGE} --name-only > /tmp/changed

# If current framework was updated
grep -q "$STRING_TO_CHECK" /tmp/changed

if [[ $? != 0 ]]; then
  echo "$STRING_TO_CHECK was not modified, exiting."
  exit 1
fi

