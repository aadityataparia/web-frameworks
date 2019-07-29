#!/bin/bash

# Exit build if not necessary
.ci/has_to_run.sh || exit 0
.ci/ci_test.sh
