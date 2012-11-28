#!/usr/bin/env roundup
#
# This file contains the test plan for the `get-job` command.
#    
#/ usage:  rerun stubbs:test -m rundeck -p get-job [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "get-job"

it_fails_without_arguments() {
    rerun rundeck:get-job || { true; }
}

it_runs_with_uuid() {



    rerun rundeck: install

    rerun rundeck: create-project --name test

    rerun rundeck: start

    timeout 30 bash -c "while [ 1 ]; do netstat -an |grep '4440 .*LISTEN'; if [ \$? -eq 0 ]; then break; fi; sleep 1; done"

    tmpJobXml=$(mktemp)
    createTestHelloWorldJobXmlFile "${tmpJobXml}"

    rerun rundeck:create-job --file "${tmpJobXml}" --username admin --password admin

    rm -f "${tmpJobXml}"

    tmpJobXmlGet=$(mktemp)

    rerun rundeck:get-job --uuid test-hello-world > ${tmpJobXmlGet}

    if ! xmlstarlet fo "${tmpJobXmlGet}" >/dev/null 2>&1
    then
       rerun_die  "rundeck:get-job did not return a valid xml document"
    fi

    
    uuid=$(xmlstarlet sel -t -m /joblist/job/uuid -v . "${tmpJobXmlGet}")
    if [ "${uuid}" != "test-hello-world" ]
    then
       rerun_die  "uuid mismatch, uuid returned: ${uuid}, should be test-hello-world"
    fi

    rm -f "${tmpJobXmlGet}"

    rerun rundeck:stop

}
