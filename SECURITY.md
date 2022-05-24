# Security Policy

## Supported Versions

Distroless currently tracks debian 11 ([buster](https://packages.debian.org/bullseye/) current) and debian 10 ([buster](https://packages.debian.org/bullseye/)) packages.

Debian tracking information at https://github.com/GoogleContainerTools/distroless/blob/main/debian_archives.bzl and generally is updated within 48 hours of debian publishing an update.

## Reporting a Vulnerability

If a distroless image you are using contains a CVE or other vulnerability:
1. find the appropriate debian security-tracker notice: `https://security-tracker.debian.org/tracker/CVE-XXXX-YYYYY`, for [example](https://security-tracker.debian.org/tracker/CVE-2022-21476).
1. check if a fix is available for the appropriate debian version in the main/security channels (ex `bullseye`, `bullseye (security)`).
    1. if a fix is not yet available, do not file a bug, track it in your internal tracker until one becomes available.
    1. if a fix is available *and* it has been more than 48 hours, please let the team know by creating an issue and pointing to the CVE or vulnerability disclosure.
