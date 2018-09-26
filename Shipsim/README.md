# IVCT Shipsim composition

This IVCT composition includes:

- the IVCT components
  - IVCT Simulation components: the Pitch CRC and license
  - IVCT components: AMQ, TC Runner, Log Sink and the GUI
  - IVCT run time configuration data
  - IVCT test suite data: Encoding Rules data  

- the SUT components

  - A single ship simulation in the Gulf region

    

For simplicity we assume that the composition runs on a single Docker Host.



Steps to get going:

1. Create/edit a `.env` file and define the following environment variables:

   - ``LICENSE_IMAGE`` to your license image with your license key in it.
   - ``MAC_ADDRESS`` to the MAC address value associated with the license key.
   - ``WEBUI_PORT`` to the network port for the Pitch web UI.
   - ``IVCTUI_PORT`` to the network port for the IVCT UI.
2. Start the composition with ``docker-compose up``.
3. Navigate to the Pitch web UI:  ``http://<DOCKERHOST>:<WEBUI_PORT>``.
4. Login to the Pitch web UI (Administrator / admin) and add the CRC that runs on host ``crc``.
5. Verify from the Pitch web UI that there is a federation with the SUT federate.
6. Navigate to the IVCT UI: ``http://<DOCKERHOST>:<IVCUI_PORT>/ivct.gui.ui.html``.
7. Login to the IVCT UI (admin / admin) and navigate to the test cases page for the SUT vrf.
8. Start  the encoding test and view its completion.

