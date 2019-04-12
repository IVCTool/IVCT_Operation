# IVCT composition for the Pitch RTI

The IVCT composition for the Pitch RTI includes the following containers:

- IVCT framework containers: AMQ, TC Runner, Log Sink and the GUI
- IVCT run time configuration data
- IVCT test suite data, in this example Encoding Rules data

The IVCT framework containers in this composition run in `host` network mode. This means that the IVCT containers use the host network stack and are visible on the network as if they run as native applications on the host.

The Pitch CRC is part of the System Under Test and therefore not part of this composition.

## Connecting to the Pitch CRC

The Local RTI Component of the TC Runner is currently explicitly configured with the default address of the Pitch CRC (`localhost:8989`)  using the environment variable `PITCH_CRCADDRESS`. See issue https://github.com/MSG134/IVCT_Framework/issues/192 for more information.

The assumption is that the CRC runs on the same host as the IVCT.

## IVCT Web UI

Connect to the IVCT Web UI on `http://${DOCKERHOST}:8080/ivct.gui.ui.html`. Login as admin, password admin.

