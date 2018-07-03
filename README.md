# IVCT_Images
This repository contains **Docker build files** to build IVCT container images and **Docker compose files** to run IVCT compositions.

This is work in progress, and not yet usable!

# Docker build files

The Dockerfiles to build container images can be found under the ``Dockerfiles`` directory

# Docker compose files

This repository contains ***blessed* Docker compositions**. These compositions are tested and work with the standard `docker-compose` command line tool. In some cases minor adaptations may been needed to run a composition in your local environment. For example, hostnames or port numbers. These adaptations are generally limited to environment settings in the `.env` file.

For each composition there is exactly one directory named `<project-name>`. A project directory must contain a `docker-compose.yml` file and a `README.md` file. Optionally the project directory may contain the following files: a `logo.png` file (for displaying purposes), a `.env` file with docker-compose environment settings, and supplementary files associated with the composition.

```
docker-compose.yml        -- required
README.md                 -- required
logo.png                  -- optional
.env                      -- optional
Other files               -- optional
```

