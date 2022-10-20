(internal document)

# Status of existing Documents

- README.md
  - some more references to entry pages
  - fix references to 'everal launch template'
- IVCT-GettingStarted-Deployment.adoc  
  - needs reworking (remove references to old deployment references)
  - maybe use portico as default RTI, in order to avoid too many adjustments in the first step
  - "using the ivct" change to "next steps"
- home.adoc
  - maybe to long
- IVCT-GettingStarted-Graphical-User-Interface.adoc
  - complete
- IVCT-Local-Settings-Designator.adoc
  - check if content is still valid
  - background information
- IVCT-running-engines-on-host.adoc      
  - up to date and complete
  - linked from IVCT background concepts 
- IVCT-TestSuite-Updating.adoc
  - maybe obsolete
- IVCT-Container-Overview.adoc
  - container background knowledge 
- IVCT-GettingStarted-HelloWorld.adoc
  - check references to folder structure
  - must be linked from IVCT Background
- IVCT-LogSink-Image.adoc
  - maybe this can be removed         
- IVCT-TCRunner-Image.adoc
  - check if information up to date
  - background information
- IVCT-Deployment-Options.adoc
  - background for experts         
  - and must be updated
- IVCT-GUI-Image.adoc
  - background information
  - need to be updated
- IVCT-Preserving-TestResults.adoc
  - background information
  - check if up to date
  - some parts are obsolete since we have the mirror
- IVCT-TestSuite-Image-Construction.adoc
  - background information
  - complete and up to date
- IVCT-Hosting.adoc    
  - check if needed
  - background information                               
- IVCT-RID-File-Configuration.adoc    
  -  background information 
- IVCT-TestSuite-Images.adoc
  - IVCT background information
  - up to date and complete

General remarks:
- file names do not have structure information, like "1-1 intro.adoc"


# Proposed Restructure

1. [Repository Landing Page](../README.md)

2. [Getting Started](src/docs/../IVCT-GettingStarted-Deployment.adoc)

3. [Adjusting the deployment to your needs]
   1. the .env settings
   2. using the profiles
   3. adding custom test suites
4. IVCT Background
   1. explain where to find test suites, which versions are to be used, etc. (this information is missing!)
   2. Example System under Test -> HelloWorld
   3. explain existing images with there configuration needs and options
5. [Containerization Background]
   1. reasoning behind current solution
   2. other deployment options
   3. the issue with using non-containerized elements like RTI products




