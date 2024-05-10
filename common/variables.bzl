"common variables"

def quote(str):
    return '''"{}"'''.format(str)

OS_RELEASE = dict(
    PRETTY_NAME = "Distroless",
    NAME = "Debian GNU/Linux",
    ID = "debian",
    VERSION_ID = "{VERSION}",
    VERSION = "Debian GNU/Linux {VERSION} ({CODENAME})",
    HOME_URL = "https://github.com/GoogleContainerTools/distroless",
    SUPPORT_URL = "https://github.com/GoogleContainerTools/distroless/blob/master/README.md",
    BUG_REPORT_URL = "https://github.com/GoogleContainerTools/distroless/issues/new",
)

NOBODY = 65534
NONROOT = 65532
ROOT = 0

# TODO: this should be 0, but for now we'll use this to minimize diff.
MTIME = "946684800"
