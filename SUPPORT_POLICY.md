Distroless currently tracks Debian on their [standard support timeline](https://wiki.debian.org/DebianReleases#Production_Releases).

The current estimation of end of life for images with the pattern:

`gcr.io/distroless/<image>-debian<version>:(latest|nonroot|debug|debug-nonroot)`

| Image       | Debian 12 EOL  | Debian 13 EOL               |
| ----------- | -------------- | --------------------------- |
| static      | Sept 2026      | debian 14 release day + 1yr |
| base        | Sept 2026      | debian 14 release day + 1yr |
| base-nossl  | Sept 2026      | debian 14 release day + 1yr |
| cc          | Sept 2026      | debian 14 release day + 1yr |
| java*       | Jan 2026       | debian 14 release day + 3mo |
| node*       | Jan 2026       | debian 14 release day + 3mo |
| python*     | Jan 2026       | debian 14 release day + 3mo |

\* see below for language specific runtime notes


### Java
Java will only support current LTS version distributed by debian [see here](https://wiki.debian.org/Java).

### Node
Node version support is for even numbered releases (20, 22, 24, etc) that are current, active or in LTS maintenance. For more information, [see here](https://nodejs.org/en/about/previous-releases#release-schedule).

### Python (TBD)

### Images no longer supported
A list of supported image tags is available here: https://github.com/GoogleContainerTools/distroless#what-images-are-available
