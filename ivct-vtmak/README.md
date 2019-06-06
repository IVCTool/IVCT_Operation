# IVCT composition for the VTMaK RTI

The IVCT composition for the VTMaK RTI includes the following containers:

- IVCT framework containers: AMQ, TC Runner, Log Sink and the GUI
- IVCT run time configuration data
- IVCT test suite data, in this example Encoding Rules data

The IVCT framework containers in this composition run in `host` network mode. This means that the IVCT containers use the host network stack and are visible on the network as if they run as native applications on the host.

The VTMaK RTI Exec and Forwarder are part of the System Under Test and therefore not part of this composition.

## Connecting to the VTMaK RTI Exec

The Local RTI Component of the TC Runner is currently explicitly configured with the default address of the VTMaK RTI Exec (`localhost:4000`)  using the environment variable `MAK_RTIEXECADDRESS`. See issue https://github.com/MSG134/IVCT_Framework/issues/192 for more information.

The assumption is that the RTI Exec runs on the same host as the IVCT.



