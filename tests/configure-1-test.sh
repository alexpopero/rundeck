#!/usr/bin/env roundup
#
# This file contains the test plan for the `configure` command.
#    
#/ usage:  rerun stubbs:test -m rundeck -p configure [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "configure"


it_succeeds_with_a_trivial_configure_command() {
    rerun rundeck:install
    rerun rundeck:configure
}
