Distroless currently tracks Debian on their [standard support timeline](https://wiki.debian.org/DebianReleases#Production_Releases).

The current estimation of end of life for images with the pattern:

`gcr.io/distroless/<image>-debian<version>:(latest|nonroot|debug|debug-nonroot)`

| Image       | Debian 10 EOL | Debian 11 EOL   |
| ----------- | ------------- | --------------- |
| static      | aug 2022      | debian 12 + 1yr |
| base        | aug 2022      | debian 12 + 1yr |
| cc          | aug 2022      | debian 12 + 1yr |
| java*       | jan 2022      | debian 12 + 3mo |
| node*       | jan 2022      | debian 12 + 3mo |
| python*     | jan 2022      | debian 12 + 3mo |

\* see below for language specific runtime notes


### Java
Java will only support current LTS version distributed by debian [see here](https://wiki.debian.org/Java).

### Node
Node version support is for even numbered releases (12, 14, etc) that are current, active or in LTS maintenance. For more information, [see here](https://nodejs.org/en/about/releases/).

### Python
Python support is experimental, and this project does not make any guarantees about the version of python in images.


### Images no longer supported (TBD)
