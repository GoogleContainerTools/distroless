Distroless currently tracks Debian on their [standard support timeline](https://wiki.debian.org/DebianReleases#Production_Releases).

The current estimation of end of life for images with the pattern:

`gcr.io/distroless/<image>-debian<version>:(latest|nonroot|debug|debug-nonroot)`

| Image       | Debian 11 EOL               |
| ----------- | --------------------------- |
| static      | debian 12 release day + 1yr |
| base        | debian 12 release day + 1yr |
| base-nossl  | debian 12 release day + 1yr |
| cc          | debian 12 release day + 1yr |
| java*       | debian 12 release day + 3mo |
| node*       | debian 12 release day + 3mo |
| python*     | debian 12 release day + 3mo |

\* see below for language specific runtime notes


### Java
Java will only support current LTS version distributed by debian [see here](https://wiki.debian.org/Java).

### Node
Node version support is for even numbered releases (16, 18, 20, etc) that are current, active or in LTS maintenance. For more information, [see here](https://nodejs.org/en/about/releases/).

### Python
Python support is experimental, and this project does not make any guarantees about the version of python in images.

### Images no longer supported (TBD)
