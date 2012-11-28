#!/usr/bin/env roundup
#
# This file contains the test plan for the `delete-job` command.
#    
#/ usage:  rerun stubbs:test -m rundeck -p delete-job [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "delete-job"

it_fails_without_arguments() {
    rerun rundeck:delete-job || { true; }
}

it_runs_with_arguments() {

    rerun rundeck: install
    rerun rundeck: create-project --name test

    tmpJobXml=$(mktemp)
    createTestHelloWorldJobXmlFile "${tmpJobXml}"

    rerun rundeck: start

    timeout 30 bash -c "while [ 1 ]; do netstat -an |grep '4440 .*LISTEN'; if [ \$? -eq 0 ]; then break; fi; sleep 1; done"

    rerun rundeck: create-job --file "${tmpJobXml}" --username admin --password admin

    rm -f "${tmpJobXml}"

    rerun rundeck:delete-job --uuid "test-hello-world" --username admin --password admin

    rerun rundeck: stop

    rerun rundeck: remove --cleanup true
}
