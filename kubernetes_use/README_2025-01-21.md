# How to get and use  IVCT-Images in kubernetes

To run the Interoperability, Verification and Certification Tool (IVCT)   in a container environment, you need to load different images and start several containers created from them.


### IVCT setup in a Docker application
Controlled by Docker Compose Files .env and docker-compose-*.yml
docker-Compose  fetch the necessary images, compiles the containers  and start them.

The docker-compose-*.yml contains various sections for processing the different components of the IVCT environment.


### IVCT setup in a Kubernetes surrounding
In the Kubernetes environment, *.yaml files can be used to fulfill these tasks.

Here too, several tasks can be combined in a *.yaml file.  
To be able to better control and test the various settings of the containers / jobs, we have used individual scripts for each task.

Success also depends on the order in which the individual components are started.


### Prerequisite:  common data directory

First of all, it must be ensured that there is a data directory to which various deployments have read and write access.
One possibility is to use a directory provided by an NFS server.

The scripts 01* and 02* establish a connection to an NFS share, and make it available for other scripts  
01_nfs-pv.yaml  
02_nfs-pvc.yaml


### Execution of images with only one task
To provide information and necessary files for IVCT tests,
containers from some images  are started only once.
They copy files to the shared data area.

In the Kubernetes application, these executions are called jobs


#### 11_runtime-config_job.yaml
Job -- Name:  runtime-config-job --  image:  ivct/runtime-config:4.1.0

Should be executed relatively early in order to create the necessary directory structures in the shared directory and transfer various data to it.
e.g. the Directories  ( with content)  Badges IVCTsut  TestSuites  + Datei IVCT.properties

Variables:  No further variables necessary  
MountPoint: /runtimeconfig   ( to the NFS-Volume , name can be freely chosen)  
important is here: 
 [Command]   and  [Arguments] :  
cp  -r /root/conf/TestSuites -r /root/conf/Badges -r /root/conf/IVCTsut /root/conf/IVCT.properties /runtimeconfig


##### IVCT.properties
Now the file IVCT.properties should be located in " /runtimeconfig", in the shared directory, here an NFS-volume.
This will later be read by other applications for their start.
Values of the necessary variables that differ from the standard can be entered here.


####  12_ts-helloworld-job.yaml
Job -- Name:  ts-helloworld-job -- image: ivct/ts-helloworld:2.1.3-SNAPSHOT  
Variables:  No further variables necessary  
MountPoint: /runtimeconfig   ( to the NFS-Volume , name can be freely chosen)  
Command:    cp    -r /root/conf/TestSuites/TS_HelloWorld-2.1.3-SNAPSHOT /runtimeconfig/TestSuites

####  13_ts-hla-encoding-rules_job.yaml
Job -- Name: ts-hla-encoding-rules -- image: ivct/ts-hla-encoding-rules:2.1.2-SNAPSHOT
MountPoint:     /runtimeconfig  
[Command]  [Arguments]
cp   -r /root/conf/TestSuites/TS_HLA_EncodingRulesTester-2.1.2-SNAPSHOT  /runtimeconfig/TestSuites


#### 14_ts-hla-cs-verification_job.yaml
Job -- Name:  ts-hls-cs-verification -- image: ivct/ts-hla-cs-verification:2.1.2-SNAPSHOT  
MountPoint:     /runtimeconfig  
Command]  [Arguments]
cp            -r /root/conf/TestSuites/TS_CS_Verification-2.1.2-SNAPSHOT /runtimeconfig/TestSuites


#### 15_ts-hla-service_job.yaml
Job -- Name:  ts-hla-services -- image: ivct/ts-hla-services:2.1.2-SNAPSHOT  
MountPoint:     /runtimeconfig  
Command]  [Arguments]
cp            -r  /root/conf/TestSuites/TS_HLA_Services-2.1.2-SNAPSHOT /runtimeconfig/TestSuites


#### 16_ts-hla-object_job.yaml
Job -- Name: ts-hla-object --  image: ivct/ts-hla-object:2.1.2-SNAPSHOT  
MountPoint:     /runtimeconfig  
Command]  [Arguments]
cp            -r  /root/conf/TestSuites/TS_HLA_Object-2.1.2-SNAPSHOT /runtimeconfig/TestSuites


#### 17_ts-hla-declaration_job.yaml
Job -- Name: ts-hla-declaration --  image: ivct/ts-hla-declaration:2.1.2-SNAPSHOT  
MountPoint:     /runtimeconfig  
Command]  [Arguments]
cp            -r  /root/conf/TestSuites/TS_HLA_Declaration-2.1.2-SNAPSHOT   /runtimeconfig/TestSuites


####  18_ts-designator_job.yaml
Job -- Name: ts-designator --  image:  ivct/ts-designator:1.0.2-SNAPSHOT  
MountPoint:     /runtimeconfig  
[Command]  [Arguments]
cp                 -r /root/conf/TestSuites/TS_Designator-1.0.2-SNAPSHOT /runtimeconfig/TestSuites

##### The Execution of these  Pods with only one task can be terminated  after they have done their job

### Execution of images for deployments and services

####  31_activemq_deployment.yaml  
Name:   activemq  --   image: rmohr/activemq:5.14.5-alpine  
Variables: no variables necessary but we use for test purposes IVCT_HOME ,  IVCT_CONF  
Ports:  "activemq"  61616  ,  "activemq-web" 8161     TCP  
MountPoint:  /root/conf  ( not  necessary but for  test purposes /root/conf to the NFS-Volume ) 

#### 32_activemq_service.yaml
Name:  activemqsrvc  
Ports:   &nbsp;  &nbsp; "61616" &nbsp;    61616  &nbsp;  &nbsp;   "8161"   8161  
selector: &nbsp; &nbsp; app: activemq  

#### 33_logsink_deployment.yaml  
Name: logsink    --       image:  ivct/logsink:4.1.0  
Variables:  
&emsp; ACTIVEMQ_HOST:  &nbsp;   activemq    ( or IP of activemq deployment)  
&emsp; ACTIVEMQ_PORT:   &nbsp;  "61616"  
&emsp;  IVCT_HOME:   &nbsp;   /root/conf  
&emsp; IVCT_CONF:   &nbsp;    /root/conf/IVCT.properties  
MountPoint:   /root/conf  
 &emsp;   &emsp;   &emsp;  &emsp;  /logs  
( The logs are “in" the logsink container in /logs/LogSink.log  
to see them in the shared NFS volume we add a mountpoint: /logs with SubPath logs )


#### 36_gui_deployment.yaml
Name:  gui    --  image:   ivct/gui:4.1.0  
Variables:  
&emsp; ACTIVEMQ_HOST:  &nbsp;   activemq    ( or IP of activemq deployment)  
&emsp; ACTIVEMQ_PORT:   &nbsp;  "61616"  
&emsp;  IVCT_HOME:   &nbsp;   /root/conf  
&emsp; IVCT_CONF:   &nbsp;    /root/conf/IVCT.properties  
&emsp; PRTI1516E_HOME:  &nbsp;  /root/conf/prti1516e  
&emsp; LRC_HOME:    &nbsp;    /root/conf/prti1516e  
&emsp; LRC_CLASSPATH:  &nbsp;   /root/conf/prti1516e/lib/prti1516e.jar  
Ports:  "ivctgui"   8080  
MountPoint:  /root/conf 


#### 37_gui_service.yaml 
name: guisrvc  
type:    NodePort  
ports:   "gui-port" &nbsp;    port: 8080  
selector: &nbsp; &nbsp; app: gui  


### Launch all necessary pods 
If all necessary *.yaml files are in one folder, all pods can be started at once by:  
kubectl  apply -f  ./dirname

But it is possible that this puts a heavy load on the server's resources.  

Therefore we have added 2 scripts to start the pods in different groups  
aaa_start_all_1.sh    &emsp;    start all the pods which can be stopped after they have done their job,  
aaa_start_all_2.sh   &emsp;   starts our  deployments and services

Nevertheless, it may be that one or the other deployment has to be restarted in order to start up cleanly.  
Now you should have access to the IVCT-Gui  with a Web-Browser 

### In Case of using    minikube  &emsp; &emsp;  Reach the dashboard
minikube has a web-based user interface,  
To get the dashboard URL:  minikube dashboard  --url     gives the URL  
                                                

### Reach the IVCT-GUI  

Rancher: Via the menu item Services you can see the services started for each namespace, and can read out the URL to reach this service in the browser.   
minikube:  “minikube service list”     shows the services provided.




























