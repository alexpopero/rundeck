#!/usr/bin/env roundup
#
# This file contains the test plan for the install command.
# Execute the plan by invoking: 
#    
#     rerun stubbs:test -m rundeck -p install
#

# The Plan
# --------

describe "install"

it_runs_without_arguments() {
    rerun rundeck:remove
    rerun rundeck:install
    rerun rundeck:remove
}
