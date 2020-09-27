# IVCT Operation

The IVCT_Operation repository provides several templates for launching the containerized software of the **Interoperability, Verification and Certification Tool (IVCT)**. This software consists of a general purpose testing framework (see https://github.com/IVCTool/IVCT_Framework) and specific test suite packages, which are designed to test interoperability requirements for federated simulations. In order to run the software, the framework needs to be compiled, configured, and bundled with a selection of test suites into an integrated runtime environment. The launch templates within this repository provides examples for this kind of software compositions.

Following the principles of the **Modelling and Simulation as a Service (MSaaS)** paradigm, the required IVCT components are provided as Docker container images, and the composition of container images is described in Docker Compose files.

Federated simulations use communication environments to communicate and synchronize in virtual environments. The current IVCT implementation uses the **High Level Architecture (HLA)** standard for that purpose. There are several implementations for the HLA standard available, so called **Run-Time Infrastructures (RTI)**. This repository provides several launch template examples for the most commonly used RTIs, which are also the top level entries for this repository.

## Further information

Further information about the IVCT deployment and the operation concepts can be found in the [documentation](docs/src/home.adoc) section of this repository.


## LICENCE

Copyright 2020 NATO/OTAN

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0
