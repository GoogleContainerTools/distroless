"common variables"

BASE_ARCHITECTURES = ["amd64", "arm64"]

# Exceptions:
# - s390x doesn't have libunwind8.
#   https://github.com/GoogleContainerTools/distroless/pull/612#issue-500157699
# - ppc64le doesn't have stretch security-channel.
#   https://github.com/GoogleContainerTools/distroless/pull/637#issuecomment-728139611
# - arm needs someone with available hardware to generate:
#   //experimental/python3/ld.so.arm.cache
ARCHITECTURES = BASE_ARCHITECTURES + ["arm", "s390x", "ppc64le"]

VARIANTS = {
    "arm": "v7",
    "arm64": "v8",
}

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

# language images (java, node, python, etc) have shorter support windows
# see SUPPORT_POLICY.md
LANG_DISTS = ["debian11"]

DISTS = ["debian11", "debian12"]

VERSIONS = [
    ("debian11", "bullseye", "11"),
    ("debian12", "bookworm", "12"),
]

variables = struct(
    # ARCH
    BASE_ARCHS = BASE_ARCHITECTURES,
    ARCHS = ARCHITECTURES,
    VARIANTS = VARIANTS,

    # TEMPLATES
    OS_RELEASE = OS_RELEASE,

    # DIST
    VERSIONS = VERSIONS,
    DISTS = DISTS,
    LANG_DISTS = LANG_DISTS,

    # GROUP IDS
    NOBODY = 65534,
    NONROOT = 65532
)

matrix = struct(
    # DIST ARCH
    DIST_ARCH = [
        "%s_%s" % (dist, arch)
        for dist in variables.DISTS
        for arch in variables.ARCHS
    ],
    DIST_ARCH_ALL = [
        ("%s_%s" % (dist, arch), dist, arch)
        for dist in variables.DISTS
        for arch in variables.ARCHS
    ]
)