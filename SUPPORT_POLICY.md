Distroless currently tracks Debian on their [standard support timeline](https://wiki.debian.org/DebianReleases#Production_Releases).

The current estimation of end of life for images with the pattern:

`gcr.io/distroless/<image>-debian<version>:(latest|nonroot|debug|debug-nonroot)`

| Image       | Debian 11 EOL               | Debian 12 EOL               |
| ----------- | --------------------------- | --------------------------- |
| static      | 2024-06-01                  | debian 13 release day + 1yr |
| base        | 2024-06-01                  | debian 13 release day + 1yr |
| base-nossl  | 2024-06-01                  | debian 13 release day + 1yr |
| cc          | 2024-06-01                  | debian 13 release day + 1yr |
| java*       | 2023-12-01                  | debian 13 release day + 3mo |
| node*       | 2023-12-01                  | debian 13 release day + 3mo |
| python*     | 2023-12-01                  | debian 13 release day + 3mo |

\* see below for language specific runtime notes


### Java
Java will only support current LTS version distributed by debian [see here](https://wiki.debian.org/Java).

### Node
Node version support is for even numbered releases (18, 20, 22, etc) that are current, active or in LTS maintenance. For more information, [see here](https://nodejs.org/en/about/previous-releases#release-schedule).

### Python on Debian 11
Python on Debian 11 support is experimental, and this project does not make any guarantees about the version of python in images.

### Images no longer supported (TBD)
A list of supported image tags is available here: https://github.com/GoogleContainerTools/distroless#what-images-are-available
