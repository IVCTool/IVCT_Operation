# IVCT Shipsim composition

The IVCT Shipsim composition is provided for three RTIs:

- Pitch: ``pi-docker-compose.yml``
- VTMaK: ``ma-docker-compose.yml``
- Portico: ``po-docker-compose.yml``



Each IVCT composition includes:

- the IVCT components
  - IVCT simulation components (there are RTI dependent;, e.g. the Pitch CRC image and Pitch license image
  - IVCT components: AMQ, TC Runner, Log Sink and the GUI
  - IVCT run time configuration data
  - IVCT test suite data: Encoding Rules data  

- the SUT components

  - A single ship simulation in the Gulf region

    

For simplicity we assume that the composition runs on a single Docker Host.

Steps to get going:

1. Create/edit a `.env` file and define the following environment variables:

   - ``LICENSE_IMAGE`` to your license image with your license key in it (for the Pitch RTI).
   - ``MAC_ADDRESS`` to the MAC address value associated with the license key (for Pitch the RTI).
   - ``WEBUI_PORT`` to the network port for the Pitch web UI.
   - ``IVCTUI_PORT`` to the network port for the IVCT UI.
2. Start the IVCT composition; for e.g. the Pitch RTI do ``docker-compose -f pi-docker-compose.yml up``.
3. Navigate to the Pitch web UI:  ``http://<DOCKERHOST>:<WEBUI_PORT>``.
4. Login to the Pitch web UI (Administrator / admin) and add the CRC that runs on host ``crc``.
5. Verify from the Pitch web UI that there is a federation with the SUT federate.
6. Navigate to the IVCT UI: ``http://<DOCKERHOST>:<IVCUI_PORT>/ivct.gui.ui.html``.
7. Login to the IVCT UI (admin / admin) and navigate to the test cases page for the SUT vrf.
8. Start  the encoding test and view its completion.

