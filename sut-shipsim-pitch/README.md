# SUT Shipsim composition for Pitch RTI

This is the System Under Test composition for Shipsim.

The composition includes a Pitch CRC for the IVCT to connect to (port `8989`). The composition also includes the Pitch Web UI to monitor the SUT from a web browser (port `8181`).

## Pitch Web UI configuration

Connect to the Pitch Web UI on `http://${DOCKERHOST}:8181`. Login as Administrator, password admin.

Navigate to Settings and Edit the existing CRC connection. Change Host to `crc`.

## Pitch license information

The Pitch CRC license information must be defined in the `.env` file:

- ``LICENSE_IMAGE``: license image with your license key in it.
- ``MAC_ADDRESS``: MAC address value associated with the license key.