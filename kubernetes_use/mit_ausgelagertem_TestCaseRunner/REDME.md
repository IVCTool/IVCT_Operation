### IVCT in kubernetes-Cluster mit ausgelagerter Test-Case-Runner-Anwendung (tc.exec) und einem externen SUT:

Da es in einer komplett in Kubernetes ausgeführten Testumgebung nicht gelungen ist,  
die Kommunikation zwischen der extern gestarteten RTI und den innerhalb des Kubernetes-Cluster laufenden Anwendung Tc-runner (test-engine), und als Test-federate (SuT)  'Helloworld', herzustellen, wurde eine geteilte Anwendungs-Umgebung  verwendet.

Beschreibung dazu hier:  
[IVCT_kubernetes_mit_ausgelagertem_TestCaseRunner_2026-03-02.md](./IVCT_kubernetes_mit_ausgelagertem_TestCaseRunner_2026-03-02.md)

Hier  werden beispielhaft die zu der beschriebenen Umbebung verwendbaren  Kubernetes-Daeieien zur Verfügung gestellt.   
Voraussetzungen:  
\- Installierte  RTI, hier z.B. prti1516

\- Da ein Teil einer Runtime-Umgebung benoetigt wird, muss diese geholt und z.T. uebersetzt werden  
   &emsp; git clone  https://github.com/IVCTool/IVCT_Framework.git ,  gradlew clean DistTar war , ...   
   &emsp; git clone  https://git@github.com:IVCTool/IVCT_TestSuiteDevelopment, gradlew clean DistTar war , ...  
 
\- Dann die z.B  TC.exec/build/distribution/TC.exec[ ].tar und   
   &emsp; &emsp; &emsp; &emsp; IVCT_TestSuiteDevelopment/build/distribution/HelloWorld-2-1-3-SNAPSHOT.tar  
   &emsp; auspacken in das gewaehlte Runtime-Verzeichnis IVCT_Runtime/TC.exec und IVCT_Runtime/Helloworld

\- Ein Startscript,  wie z.B. ####################

   
ff
    
