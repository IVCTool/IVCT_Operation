# IVCT Hello World composition

This composition includes various components to test the HelloWorld federate application. Main parts in the Hello World composition are:

- Simulation infrastructure components: the Pitch CRC and an X Server
- IVCT components: AMQ, TC Runner, Log Sink and the GUI
- IVCT run time configuration data
- IVCT Test Suite data: Hello World data and Encoding Rules data  

For simplicity we assume that the composition runs on a single Docker Host.



Steps to get going:

1. Edit the `.env` file to set the ``DOCKERHOST`` to the hostname or IP address of the Docker Host.

2. Start the composition with ``docker-compose up``.

3. From the same or another host start the HelloWorld application; provide the hostname or IP address of the Docker Host and use ``A`` as the name of the federation. Leave other values to their default.

4. Navigate to the X Server web page 

   URL: ``<Docker Host>:8081/vnc_auto.html``

5. Verify from the Pitch CRC UI that there is a federation with one federate named ``A``.

6. Navigate to the IVCT web page.

   URL: ``<Docker Host>:8180/nato.ivct.gui.nato.ivct.gui.ui.html``

7. Login to the IVCT (admin / admin) and navigate to the test cases page.

8. Start a test and view its completion.

