Dockerize staticSearch

- base the Docker image on the Ant one
  - https://github.com/paulushcgcj/apacheant - uses Alpine
  - https://github.com/breauxaj/docker-java - at https://hub.docker.com/r/breauxaj/java  uses Alpine, more recent; includes Maven
- let the staticSearch app live inside the Docker container
- let a jekyll environment be mounted in the Docker container, so that it can do jekyll build
- mount two volumes: 
  - Jekyll directory
  - staticSearch home directory
- adapt _scripts/updateStaticSearch.sh to a script that runs as cmd in Docker container
  - generate version id
  - in Jekyll volume, run jekyll build and tidy
  - in staticSearch home volume, run Ant staticSearch
  - in Jekyll volume, rsync the staticSearch artefacts (which were built in _site) up into Jekyll home
- provide a simple script that runs the container and mounts the volumes and runs staticSearch
- use docker-api gem to run the process from a jekyll plugin: https://github.com/swipely/docker-api