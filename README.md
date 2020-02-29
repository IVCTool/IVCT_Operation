# About the IVCT

The Integration, Verification and Certification Tool (IVCT) is a tool that facilitates the testing of a distributed simulation system, a so called System under Test (SuT). The IVCT includes a software framework for the implementation and execution of test cases to verify the compliance of a SuT against interoperability requirements.

Main concepts used by the IVCT are:

- An **Interoperability Requirement** (IR) is related to how the SuT should interact and exchange information. IRs are specified to ensure that a system component can be easily combined- and interoperate with other system components.

- A **Capability Badge** (CB) is defined as a token of achievement in terms of passing the tests related to interoperability requirements (IRs) that are associated with the CB. Successful compliance testing, verification, and certification of a SuT's compliance with sets of IRs is expressed as a set of CBs representing this achievement.

- A **Test Case** (TC) is a script or compiled program that can execute as part of IVCT for verifying the associated IRs. The execution of a TC is called a test.
- A **Test Suite** (TS) is a grouping of Test Cases.

The IVCT consists of several components and provides a web-based user interface to view badges, test suites, and SuT definitions; define a SuT and configure the connection with the SuT; initiate a test against the SuT; and view test results.

## IVCT deployment and operation

The IVCT is provided in the form of container images that can be deployed with a singe **Docker compose file**. This repository contains several Docker compose files for deploying the IVCT in different modes and configurations, depending on the needs and requirements of the local environment.

Further information about the IVCT deployment and operation can be found in the [documentation](docs/src/home.adoc) section of this repository.

## LICENCE

Copyright 2020 NATO/OTAN

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0