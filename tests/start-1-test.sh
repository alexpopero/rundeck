#!/usr/bin/env roundup
#
# This file contains the test plan for the start command.
# Execute the plan by invoking: 
#    
#     rerun stubbs:test -m rundeck -p start
#

# The Plan
# --------

describe "start"

it_runs_without_arguments() {
    rerun rundeck:install
    rerun rundeck:stop
    rerun rundeck:start
    rerun rundeck:stop
    rerun rundeck:remove
}
