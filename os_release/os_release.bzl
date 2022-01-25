"""A rule to build os-release information for debian-distroless releases."""

def _impl(ctx):
    ctx.actions.run_shell(
        outputs = [ctx.outputs.tar],
        tools = [] + ctx.files._build_tar,
        arguments = [
            ctx.outputs.tar.path,
            ctx.attr.codename,
            ctx.attr.version,
        ],
        env = {
            "BUILD_TAR": ctx.executable._build_tar.path,
            "DEBIAN_VERSION": ctx.attr.version,
            "DEBIAN_CODENAME": ctx.attr.codename,
        },
        command = """
            set -o errexit

            OS_RELEASE_FILE=./usr/lib/os-release
            mkdir -p $(dirname $OS_RELEASE_FILE)

            cat << EOF >> $OS_RELEASE_FILE
PRETTY_NAME="Distroless"
NAME="Debian GNU/Linux"
ID="debian"
VERSION_ID="$DEBIAN_VERSION"
VERSION="Debian GNU/Linux $DEBIAN_VERSION ($DEBIAN_CODENAME)"
HOME_URL="https://github.com/GoogleContainerTools/distroless"
SUPPORT_URL="https://github.com/GoogleContainerTools/distroless/blob/master/README.md"
BUG_REPORT_URL="https://github.com/GoogleContainerTools/distroless/issues/new"
EOF

            $BUILD_TAR  --output "$1" \
                        --file $OS_RELEASE_FILE=$OS_RELEASE_FILE \
        """,
    )

os_release = rule(
    attrs = {
        "codename": attr.string(
            mandatory = True,
        ),
        "version": attr.string(
            mandatory = True,
        ),
        # Implicit dependencies.
        "_build_tar": attr.label(
            default = Label("@rules_pkg//:build_tar"),
            cfg = "host",
            executable = True,
        ),
    },
    executable = False,
    outputs = {
        "tar": "%{name}.tar",
    },
    implementation = _impl,
)
