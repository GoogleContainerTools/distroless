"""A rule to unpack minimal locales from the debian package."""

def _impl(ctx):
    ctx.actions.run_shell(
        inputs = [ctx.file.deb],
        outputs = [ctx.outputs.tar],
        tools = [] + ctx.files._build_tar + ctx.files._dpkg_extract,
        arguments = [
            ctx.file.deb.path,
            ctx.outputs.tar.path,
        ],
        env = {
            "EXTRACT_DEB": ctx.executable._dpkg_extract.path,
            "BUILD_TAR": ctx.executable._build_tar.path,
        },
        command = """
            $EXTRACT_DEB "$1" ./usr/lib/locale/C.UTF-8 ./usr/share/doc/libc-bin/copyright

            $BUILD_TAR  --output "$2" \
                        --mode 0644 \
                        --file ./usr/share/doc/libc-bin/copyright=./usr/share/doc/libc-bin/copyright \
                        --file ./usr/lib/locale/C.UTF-8=./usr/lib/locale/C.UTF-8
        """,
    )

locale = rule(
    attrs = {
        "deb": attr.label(
            allow_single_file = [".deb"],
            mandatory = True,
        ),
        # Implicit dependencies.
        "_build_tar": attr.label(
            default = Label("@rules_pkg//:build_tar"),
            cfg = "host",
            executable = True,
        ),
        "_dpkg_extract": attr.label(
            default = Label("//package_manager:dpkg_extract"),
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
