Rerun Rundeck module
====================

Rerun module to manage Rundeck installation, configuration and operations

Rerun and Rerun Module Installation
------------

* Install Rerun itself by obtaining the latest "rerun" RPM package link from [Rerun Downloads](https://github.com/rerun/rerun/downloads) page and executing the following command (replacing example URL):
<pre>
[root@centos62 ~]# rpm -Uvh https://github.com/downloads/rerun/rerun/rerun-1.0-124.noarch.rpm
Retrieving https://github.com/downloads/rerun/rerun/rerun-1.0-124.noarch.rpm
Preparing...                ########################################### [100%]
   1:rerun                  ########################################### [100%]
</pre>

* Install the latest version of the rerun-modules Yum repo definition by obtaining the latest "rerun-modules-repo" RPM package link from [Rerun Modules Downloads](https://github.com/rerun-modules/rerun-modules/downloads) and executing the following command (replacing example URL): 
<pre>
[root@centos62 ~]# rpm -Uvh https://github.com/downloads/rerun-modules/rerun-modules/rerun-modules-repo-1.0-21.noarch.rpm
Retrieving https://github.com/downloads/rerun-modules/rerun-modules/rerun-modules-repo-1.0-21.noarch.rpm
Preparing...                ########################################### [100%]
   1:rerun-modules-repo     ########################################### [100%]
</pre>

* Install all the latest rerun modules (including this Rundeck module):
<pre>
[root@centos62 ~]# yum -y --disablerepo '*' --enablerepo 'rerun-modules' install '*'
.
.
.
Complete!
</pre>

* Review the available modules:
<pre>
[root@centos62 ~]# which rerun
/usr/bin/rerun
[root@centos62 ~]# rerun
Available modules in "/usr/lib/rerun/modules":
  apache-maven: "Rerun module to manage the apache-maven distribution"
  github: "Rerun module to manage working with Github"
  jboss-as: "Rerun module to manage working with the JBoss application server"
  jenkins: "Rerun module to manage Jenkins installation, configuration and operations"
  mysql: "Rerun module to manage working with the MySQL database server"
  rpm: "Manage the full life-cycle of RPM packages"
  rundeck: "Rerun module to manage Rundeck installation configuration and operations"
  ssh: "Rerun module for managing secure shell client and server usage"
  stubbs: "Simple rerun module builder"
</pre>

* Note that several commands rely on xmlstarlet(1) (which is available from [EPEL](http://fedoraproject.org/wiki/EPEL)).

An example of using the Rerun Rundeck module from installing, creating a project, starting the server, and creating a job
------------
* Install, create a project, start the Rundeck server, and create a job
<pre>
[chuck@mvn-sdp-0 rundeck]$ rerun rundeck:install
Failed to set locale, defaulting to C
Failed to set locale, defaulting to C
[chuck@mvn-sdp-0 rundeck]$ rerun rundeck:create-project
[chuck@mvn-sdp-0 rundeck]$ rerun rundeck:create-project --name test
[chuck@mvn-sdp-0 rundeck]$ rerun rundeck:start  
Starting rundeckd:                                         [  OK  ]
nohup: redirecting stderr to stdout
[chuck@mvn-sdp-0 rundeck]$ rerun rundeck:create-job --file /home/chuck/workspace/rerun-modules/rundeck/templates/job/hello-world.xml 
</pre>




