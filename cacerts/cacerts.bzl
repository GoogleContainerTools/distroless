"""A rule to unpack ca certificates from the debian package."""

def _impl(ctx):
    ctx.actions.run_shell(
        inputs = [ctx.file.deb],
        outputs = [ctx.outputs.tar],
        tools = ctx.files._build_tar,
        arguments = [
            ctx.file.deb.path,
            ctx.outputs.tar.path,
        ],
        env = {
            "BUILD_TAR": ctx.executable._build_tar.path,
        },
        command = """
            set -o errexit

            tar -xf "$1" ./usr/share/ca-certificates ./usr/share/doc/ca-certificates/copyright

            CERT_FILE=./etc/ssl/certs/ca-certificates.crt
            mkdir -p $(dirname $CERT_FILE)

            CERTS=$(find usr/share/ca-certificates -type f | sort)
            for cert in $CERTS; do
              cat $cert >> $CERT_FILE
            done

            echo "[" >> cacerts.manifest
            echo '[0,"./usr/share/doc/ca-certificates/copyright","./usr/share/doc/ca-certificates/copyright","",null,null],' >> cacerts.manifest
            echo "[0,\\"$CERT_FILE\\",\\"$CERT_FILE\\",\\"\\",null,null]" >> cacerts.manifest
            echo "]" >> cacerts.manifest

            $BUILD_TAR --manifest cacerts.manifest --output "$2" --directory "/"
        """,
    )

cacerts = rule(
    attrs = {
        "deb": attr.label(
            allow_single_file = [".tar.xz"],
            mandatory = True,
        ),
        # Implicit dependencies.
        "_build_tar": attr.label(
            default = Label("@rules_pkg//pkg/private/tar:build_tar"),
            cfg = "host",
            executable = True,
        )
    },
    executable = False,
    outputs = {
        "tar": "%{name}.tar",
    },
    implementation = _impl,
)
