#!/usr/bin/env roundup
#
# This file contains the test plan for the create-project command.
# Execute the plan by invoking: 
#    
#     rerun stubbs:test -m rundeck -p create-project
#

# The Plan
# --------

describe "create-project"

it_fails_without_arguments() {
    rerun rundeck:create-project || { true; }
}

it_runs_with_project() {
    rerun rundeck: install 
    rerun rundeck: create-project --name test
    grep "^project.name=test$"  /var/rundeck/projects/test/etc/project.properties
    rerun rundeck: start
    rerun rundeck: stop
    rerun rundeck: remove --cleanup true
}
