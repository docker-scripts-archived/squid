# Transparent Squid in a Container

## Installation

  - First install `ds`: https://github.com/docker-scripts/ds#installation

  - Then get the scripts from github: `ds pull squid`

  - Create a directory for the container: `ds init squid @squid`

  - Fix the settings: `cd /var/ds/squid/ ; vim settings.sh`

  - Build image, create the container and configure it: `ds make`

  - Change squid.conf and restart: `vim squid.conf ; ds restart`
