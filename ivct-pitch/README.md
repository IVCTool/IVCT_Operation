# IVCT composition for the Pitch RTI

The IVCT composition for the Pitch RTI includes the following containers:

- IVCT framework containers: AMQ, TC Runner, Log Sink and the GUI
- IVCT run time configuration data
- IVCT test suite data, in this example Encoding Rules data

The IVCT framework containers in this composition run in `host` network mode. This means that the IVCT containers use the host network stack and are visible on the network as if they run as native applications on the host.

The Pitch CRC is part of the System Under Test and therefore not part of this composition.

## IVCT Web UI

Connect to the IVCT Web UI on `http://${DOCKERHOST}:8080`. Login as admin, password admin.

