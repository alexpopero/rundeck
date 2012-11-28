remove command
--------------

Example removal of the Rundeck installation while preserving logs and configuration
<pre>
[chuck@mvn-sdp-0 rundeck]$ rerun rundeck:remove
[chuck@mvn-sdp-0 rundeck]$ ls /var/log/rundeck /var/lib/rundeck /var/rundeck               
/var/lib/rundeck:
data  stacktrace.log  work
/var/log/rundeck:
rundeck.audit.log  rundeck.jobs.log  rundeck.log  rundeck.options.log  service.log
/var/rundeck:
projects
</pre>

Completely Remove the Rundeck Installation and ensuring logs and configuration are also removed
<pre>
[chuck@mvn-sdp-0 rundeck]$ rerun rundeck:remove --cleanup true
Stopping rundeckd:                                         [  OK  ]
Failed to set locale, defaulting to C
Failed to set locale, defaulting to C
[chuck@mvn-sdp-0 rundeck]$ ls /var/lib/rundeck /var/rundeck /var/log/rundeck
ls: cannot access /var/lib/rundeck: No such file or directory
ls: cannot access /var/rundeck: No such file or directory
ls: cannot access /var/log/rundeck: No such file or directory
</pre>
