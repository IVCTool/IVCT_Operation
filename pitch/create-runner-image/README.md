With the files in this directory you can create a functioning IVCT TC Runner container image that includes the Pitch LRC files.

Prerequisites:

- Docker run time environment is installed.
- Docker compose tool is installed.

Perform the following steps:

- Clone this repository to your workspace and change to this directory.
- Copy the RTI installer file from Pitch into this directory. A placeholder file (with no content) is already present as example.
- Note the PITCH version number in the file name.
- Edit the `.env` file and set the version numbers as required.
- Issue the command: `docker-compose build`.
- The result is the following image:  `ivct/tc-runner:pi-${IVCT_VERSION}`, where the IVCT version is the value set in the `.env` file.

The new image can be used in IVCT compositions instead of the skeleton IVCT TC Runner Application image. No file mounts for PITCH_RTI_HOME and LRC_SETTINGSDIR are required anymore.