### IVCT in kubernetes-Cluster mit ausgelagerter Test-Case-Runner-Anwendung (tc.exec) und einem externen SUT:

Da es in einer komplett in Kubernetes ausgeführten Testumgebung nicht gelungen ist,  
die Kommunikation zwischen der extern gestarteten RTI und den innerhalb des Kubernetes-Cluster laufenden Anwendungen  
Tc-runner (test-engine), und als Test-federate (SuT)  'Helloworld',  
herzustellen, wurde eine geteilte Anwendungs-Umgebung  verwendet.

Mehr Info dazu:  
[IVCT_kubernetes_mit_ausgelagertem_TestCaseRunner_2026-03-02.md](./IVCT_kubernetes_mit_ausgelagertem_TestCaseRunner_2026-03-02.md)

In diesem Verzeichnis werden beispielhaft die zu der beschriebenen Umgebung verwendbaren  Kubernetes-Dateieien zur Verfügung gestellt.   
#### Voraussetzungen:  

\-  installiertes Docker

\- installiertes Kubernetes / Minikube 

\- installiertes Helm (ohne helm muessen die hier bereitgestellten Scripte angepasst werden)

\- Installierte  RTI, hier z.B. prti1516

\- Da ein Teil einer Runtime-Umgebung benoetigt wird, muss diese geholt und z.T. uebersetzt werden  
   &emsp;  git clone https<nolink>://github.com/IVCTool/IVCT_Framework.git ,  gradlew clean DistTar war , ...   
   &emsp; git clone  https<nolink>://github.com/IVCTool/IVCT_TestSuiteDevelopment.git, gradlew clean DistTar war , ...  
 
\- Dann die z.B  TC.exec/build/distribution/TC.exec[ ].tar und   
   &emsp; &emsp; &emsp; &emsp; IVCT_TestSuiteDevelopment/build/distribution/HelloWorld-2-1-3-SNAPSHOT.tar  
   &emsp; auspacken in das gewaehlte Runtime-Verzeichnis z.B. IVCT_Runtime/TC.exec und IVCT_Runtime/Helloworld  
   
   ( der in anderem Zusammenhang bereitgestellte Script [a_buildung_IVCT-Runtime_from_scratch_2020-10-07_allNew.sh](https://github.com/IVCTool/IVCT_TestSuiteDevelopment/blob/main/docs/src/scripts/a_buildung_IVCT-Runtime_from_scratch_2020-10-07_allNew.sh)  
   koennte helfen die einzelnen Schritte zur Bereitstellung der Runtime-Umgebung nachzuvollziehen.)

\- Ein Startscript,  wie z.B. [x_RunIVCT_brf_2020-04-09.sh](https://github.com/IVCTool/IVCT_TestSuiteDevelopment/blob/main/docs/src/scripts/x_RunIVCT_brf_2020-04-09.sh)
   koennte in angepasster Form behilflich sein die gewuenschten Komponenten zu konfigurieren und auszuwaehlen.
   
#### Ausfuehrung / Start  IVCT-Umgebung 
Im Unterordner helm_ivct kann die Datei valuesIVCT.yaml  angepasst werden, notwendig sind korrekte Werte fuer  
NFS_Server:  a.abbb.ccccccc.de  
PITCH_CRCADDRESS: 10.xx.xx.19:8989  
SETTINGS_DESIGNATOR: crcAddress=10.xx.xx.19:8989  

Im Unterordner helm_ivct/templates befinden sich die Startscripte fuer die Kubernetes-Objekte.  
Sie sind hier veraenderbar, und koennen einzeln ueber  kubectl-Befehle gestartet, gesteuert, gestoppt werden.  
Helm vereinfacht die Ausführung aller Scripte durch z.B.   
&emsp;"helm install -f valuesIVCT.yaml ivct  helm_ivct"  
&emsp;"helm list"  
&emsp;"helm uninstall ivct"

In diesem Unterordner templates liegen ebenfalls die Startscripte fuer 
tc-runner-pi  
sut-helloworld-pi  
Bei einer Verwendung mit ausserhalb gestartetem  Test-Case-Runner und SUT (HelloWorld) werden diese Anwendungen gestoppt mit:  
&emsp;kubectl delete deployment tc-runner-pi  
&emsp;kubectl delete service tc-runner-pi-srvc  
&emsp;kubectl delete deployment sut-helloworld-pi  
&emsp;kubectl delete service sut-helloworld-pi-srvc  



    
