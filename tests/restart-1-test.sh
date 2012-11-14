#!/usr/bin/env roundup
#
# This file contains the test plan for the restart command.
# Execute the plan by invoking: 
#    
#     rerun stubbs:test -m rundeck -p restart
#

# The Plan
# --------

describe "restart"

it_runs_without_arguments() {
    rerun rundeck:install
    rerun rundeck:stop
    rerun rundeck:start
    rerun rundeck:restart
    rerun rundeck:stop
    rerun rundeck:remove 
}
