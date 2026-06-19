#! /bin/bash
#
# 09.04.2020 brf, Fraunhofer IOSB
# Fraunhofer Institut für Optronik,Systemtechnik und Bildauswertung
#
# x_RunIVCT.sh
#
# Startscript um die IVCT_Runtime Umgebung mit allen Bestandteilen 
# jeweils in eigenen Fenstern zu starten
#
################################################################
#
# versionen      brf
# 20250408 brf  an 4.1.0 angepasst und getestet
# 20220215 brf  Variablen hier erweitert z.B. TestEngine_LABEL
# 20220214 brf  Anpassung an neue tomcat-* Versionen
# 20210928 brf  Versuch zu entschlacken
# 20210928 brf  Anpassung an IVCT 4.0.1 
# 20201216 brf  Anpassung an IVCT 4.00 
# 20200814 brf  umsortierung 
# 20200513 brf  umsortierung 
# 20200319 brf  einige Variablen flexiber gestaltet
# 20200124 brf  Um Verwendung mit Portico statt pRTI erweitert
# 20191203 brf  Anpassung an  neue Runtime-Umgebung 
# 20190927 brf  Neuaufbau einer eigenen Test-Umgebung 
#
################################################################


# ------------------------------------------------------
# Variablen und Pfade
# ------------------------------------------------------

# IVCT_RUN  is the runtime environment
#export IVCT_RUN=/home1_phys/IVCTool_Run/IVCT_Runtime
export IVCT_RUN=/opt/IVCTool/IVCT_Runtime

#export IVCT_CONF=${IVCT_RUN}
#export IVCT_CONF=${IVCT_RUN}/IVCT.properties_pitch
export IVCT_CONF=${IVCT_RUN}/IVCT.properties

export TESTENGINE_LABEL=pitch_v5.5.2_runner1

# export SETTINGS_DESIGNATOR=crcAddress=localhost:8989

### Der Rest sollte eigentlich aus IVCT.properties gelesen werden 

# fuer ActiveMQ Start
#export ACTIVEMQ_HOME=${IVCT_RUN}/apache-activemq-5.19.0
#export ACTIVEMQ_CONF=${ACTIVEMQ_HOME}/conf


###  for HelloWorld  ohne  Abfragen
export SETTINGS_DESIGNATOR=localhost
export FEDERATE_NAME=A
export POPULATION_SIZE=100
export CYCLES=1000000

export FEDERATIONNAME=HelloWorld


export xt_opts="-bg lightblue -fg black -font 9x15" 

#echo "test activemq_home :" $ACTIVEMQ_HOME
#echo "test activemq_conf :" $ACTIVEMQ_CONF

#echo "bis hier erstmal" && exit 0

# ------------------------------------------------------
# Voraussetzung  RTI  
# ------------------------------------------------------

### die RTI - Pfade
export PRTI1516E_HOME=/opt/prti1516e

export LRC_HOME=$RTI_HOME

## rti notwendige CLASSPATH Angabe fuer pRTI  oder portico anpassen ! 
  ## CLASSPATH wird in HelloWorld Startdatei ueber LRC_CLASSPATH uebenommen
export LRC_CLASSPATH=${PRTI1516E_HOME}/lib/prti1516e.jar

### pRTI pruefen --- bitte starten   wenn Pitch-RTI verwendet wird
#pRTI_running=$(ps -ef | grep java | grep 'prti1516e/bin/pRTI1516e')
#if [ -z "$pRTI_running" ] ; then
#  /usr/local/bin/pRTI1516e &
#fi


# ------------------------------------------------------
# Startaufrufe
# ------------------------------------------------------

## sind die Scripte aus IVCT_RUN gestartet, wird hier in log alles geloggt
pushd ${IVCT_RUN} > /dev/null

#chmod 744 ${ACTIVEMQ_HOME}/bin/activemq
#xterm ${xt_opts} -e "${ACTIVEMQ_HOME}/bin/activemq start; bash" &

#echo -e "\nVerzoegerung um 5 Sekunden, damit activemq fuer LoSink bereitsteht\n"
#sleep 5s

###   Logsink wird in Kubernetes gestartet
##LogSinkVersion=LogSink-4.0.0
#LogSinkVersion=LogSink                  # es gibt nun Links auf die jew. Version
#chmod 744 ${LogSinkVersion}/bin/LogSink
#echo -e "Starte ${LogSinkVersion}/bin/LogSink \n"
#xterm ${xt_opts} -e " ${LogSinkVersion}/bin/LogSink; bash" &

# einige Tests haben nur andere Sprachdateien
#export LANG=en_US.UTF-8


##  TestEngine  als Java Version starten
##TC_execVersion=TC.exec-4.0.0
TC_execVersion=TC.exec
#chmod 744  ${TC_execVersion}/bin/TC.exec
echo -e "Starte ${TC_execVersion}/bin/TC.exec \n"
xterm ${xt_opts}  -e "${TC_execVersion}/bin/TC.exec; bash" &


### Die UI  wird  als GUI in Kubernetes gestartet
#UIVersion=UI-4.0.0
UIVersion=UI
chmod 744  ${UIVersion}/bin/UI
#echo -e "Starte ${UIVersion}/bin/UI \n"
#xterm ${xt_opts} -e " ${UIVersion}/bin/UI;bash" &


###  SuT  Helloworld  wird  entweder in Kubernetes, oder als Java gestartet
##HelloWorldVersion=HelloWorld-2.1.1
HelloWorldVersion=HelloWorld
chmod 744 ${HelloWorldVersion}/bin/HelloWorld
echo -e "Starte ${HelloWorldVersion}/bin/HelloWorld \n"
xterm ${xt_opts} -e "${HelloWorldVersion}/bin/HelloWorld; bash" &

popd > /dev/null

#read -p" bis hier erstmal, weiter mit [Enter]"
#echo   -e "\n bin nun in $(pwd) "
