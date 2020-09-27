#
# Copyright 2020 Tom van den Berg (TNO, The Netherlands).
# SPDX-License-Identifier: Apache-2.0
#

# Set default for build-time ARGs
ARG IVCT_VERSION=unknown
ARG PITCH_VERSION=unknown
ARG PITCH_VERSION_STRING=unknown

#########################
# Create Base image
#########################
FROM ubuntu:16.04 AS base

ARG PITCH_VERSION

# Install required font-related packages for install4j
RUN apt-get update && apt-get install -y libfreetype6 libfontconfig

# Set the RTI_HOME
ENV RTI_HOME=/usr/local/prti1516e

# Copy and run the pRTI Linux installer
COPY ./prti1516e*${PITCH_VERSION}*linux64*.sh /tmp/
RUN sh $(ls /tmp/*.sh) -q -d ${RTI_HOME}

###################################################
# Create a new IVCT image
###################################################
FROM ivct/tc-runner:pi-skeleton-${IVCT_VERSION}

# LRC files are installed here
ARG RTI_HOME_FROM=/usr/local/prti1516e

# Copy LRC files; note that RTI_HOME is defined in the existing IVCT image
COPY --from=base ${RTI_HOME_FROM}/include ${RTI_HOME}/include
COPY --from=base ${RTI_HOME_FROM}/lib ${RTI_HOME}/lib

# Copy LRC setting files
COPY --from=base /root/prti1516e/prti1516eLRC.settings ${RTI_HOME}
COPY --from=base /root/prti1516e/prti1516e.logging ${RTI_HOME}

# Declare version
ARG PITCH_VERSION_STRING
ENV LRC_VERSION $PITCH_VERSION_STRING
