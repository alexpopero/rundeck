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
    rerun rundeck:create-project --name donkey
    grep "^project.name=donkey$"  /var/rundeck/projects/donkey/etc/project.properties
}
