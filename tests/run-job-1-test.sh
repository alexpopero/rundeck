#!/usr/bin/env roundup
#
# This file contains the test plan for the run-job command.
# Execute the plan by invoking: 
#    
#     rerun stubbs:test -m rundeck -p run-job
#

# The Plan
# --------

describe "run-job"

it_fails_without_arguments() {
    rerun rundeck:run-job || { true; }
}

it_runs_with_arguments() {

    rerun rundeck: install

    rerun rundeck: create-project --name test

    tmpJobXml=$(mktemp)

    cp "${RERUN_MODULES}"/rundeck/templates/job/hello-world.xml "${tmpJobXml}"
    sed -i \
        -e "s+\${PROJECT_NAME}+test+g" \
        -e "s+\${JOB_NAME}+hello-world+g" \
    "${tmpJobXml}"

    rerun rundeck: start

    timeout 30 bash -c "while [ 1 ]; do netstat -an |grep '4440 .*LISTEN'; if [ \$? -eq 0 ]; then break; fi; sleep 1; done"

    rerun rundeck: create-job --file "${tmpJobXml}" --username admin --password admin

    rm -f "${tmpJobXml}"

    rerun rundeck: run-job --username admin --password admin --uuid test-hello-world

    rerun rundeck: stop

    rerun rundeck: remove --cleanup true

}
