# IVCT Hello World composition

This IVCT Hello World composition includes various IVCT components to test the HelloWorld federate application. The IVCT components in the composition are all containerized. The HelloWorld federate is a non-containerized application that runs on the same host system as where the IVCT Hello World composition is running, although this is not required per se.

Main parts in the IVCT Hello World composition are:

- Simulation infrastructure components: the Pitch CRC and an X Server
- IVCT components: AMQ, TC Runner, Log Sink and the GUI
- IVCT run time configuration data
- IVCT Test Suite data: Hello World data and Encoding Rules data  

For simplicity we assume that the composition runs on a single Docker Host.

Steps to get going:

1. Create/edit a `.env` file and define the following environment variables:

   - ``DOCKERHOST`` to the hostname or IP address of the Docker Host.
   - ``LICENSE_IMAGE`` to your license image with your license key in it.
   - ``MAC_ADDRESS`` to the MAC address value associated with the license key.
   - ``XSERVER_PORT`` to the network port for the X Server.
   - ``IVCT_GUI_PORT`` to the network port for the IVCT GUI.

2. Start the composition with ``docker-compose up``.

3. From the same or another host start the HelloWorld application; provide the hostname or IP address of the Docker Host and use ``A`` as the name of the federation. Leave other values to their default.

4. Navigate to the X Server web page 

   URL: ``<Docker Host>:8081/vnc_auto.html``

   Where the value ``8081`` must match with the ``XSERVER_PORT`` setting in the ``.env`` file.

   And where ``<Docker Host>`` should be replaced by the name of you host system.

5. Verify from the Pitch CRC UI that there is a federation with one federate named ``A``.

6. Navigate to the IVCT web page.

   URL: ``<Docker Host>:8180/ivct.gui.ui.html``

   Where the value ``8180`` must match with the ``IVCT_GUI_PORT`` setting in the ``.env`` file.

   And where ``<Docker Host>`` should be replaced by the name of you host system.

7. Login to the IVCT (admin / admin) and navigate to the test cases page.

8. Start a test and view its completion.

An example ``.env`` file is provided below:

````
DOCKERHOST=myhost
LICENSE_IMAGE=mydockerregistry.com/ivct/crc-license
MAC_ADDRESS=12:AB:34:CD:45:EF
XSERVER_PORT=8080
IVCT_GUI=443
````

