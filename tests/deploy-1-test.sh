#!/usr/bin/env roundup
#
# This file contains the test plan for the `deploy` command.
#    
#/ usage:  rerun stubbs:test -m rundeck -p deploy [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "deploy"

it_must_run_without_any_arguments() {
    rerun rundeck:deploy
}

