create-job command
------------------

Examples
--------
In the examples directory there exists a hello world job that depends on an existing Rundeck project called "test".  The following command sequence will
create the project and load the job.
<pre>
[chuck@mvn-sdp-0 rundeck]$ pwd
/home/chuck/workspace/rerun-modules/rundeck
[chuck@mvn-sdp-0 rundeck]$ rerun rundeck:create-project --name test
[chuck@mvn-sdp-0 rundeck]$ rerun rundeck:create-job --file examples/jobs/rundeck-hello-world/job.xml 
</pre>
