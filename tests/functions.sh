# 
# Test functions for command tests.
#

# - - -
# Your functions declared here.
# - - -


createTestHelloWorldJobXmlFile() {
   jobXml="$1"

    cp "${RERUN_MODULES}"/rundeck/templates/job/hello-world.xml "${jobXml}"
    sed -i \
        -e "s+\${PROJECT_NAME}+test+g" \
        -e "s+\${JOB_NAME}+hello-world+g" \
        -e "s+\${UUID}+test-hello-world+g" \
    "${jobXml}"
}
