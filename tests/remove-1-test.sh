#!/usr/bin/env roundup
#
# This file contains the test plan for the remove command.
# Execute the plan by invoking: 
#    
#     rerun stubbs:test -m rundeck -p remove
#

# The Plan
# --------

describe "remove"

it_runs_without_arguments() {
    rerun rundeck:install
    rerun rundeck:stop
    rerun rundeck:remove

    test -d /var/lib/rundeck  && { true; } || { false; }
    test -d /var/rundeck  && { true; } || { false; }
}

it_runs_with_cleanup() {
    rerun rundeck:install
    rerun rundeck:stop
    rerun rundeck:remove --cleanup true

    test -e /var/log/rundeck && { false; } || { true; }
    test -e /var/lib/rundeck  && { false; } || { true; }
    test -e /var/rundeck  && { false; } || { true; }

}


