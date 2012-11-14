#!/usr/bin/env roundup
#
# This file contains the test plan for the status command.
# Execute the plan by invoking: 
#    
#     rerun stubbs:test -m rundeck -p status
#

# The Plan
# --------

describe "status"

it_runs_with_status_up() {
    rerun rundeck:install
    rerun rundeck:start
    rerun rundeck:status
    rerun rundeck:stop
    rerun rundeck:remove
}
it_runs_with_status_down() {
    rerun rundeck:install
    rerun rundeck:stop
    rerun rundeck:status || { true; }
    rerun rundeck:remove
}
