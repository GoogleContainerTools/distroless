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
            "LOCALE_PATH": ctx.attr.path,
        },
        command = """
            $EXTRACT_DEB "$1" .$LOCALE_PATH ./usr/share/doc/libc-bin/copyright

            $BUILD_TAR  --output "$2" \
                        --mode 0644 \
                        --file ./usr/share/doc/libc-bin/copyright=./usr/share/doc/libc-bin/copyright \
                        --file .$LOCALE_PATH=.$LOCALE_PATH
        """,
    )

locale = rule(
    attrs = {
        "deb": attr.label(
            allow_single_file = [".deb"],
            mandatory = True,
        ),
        "path": attr.string(
            mandatory = True,
        ),
        # Implicit dependencies.
        "_build_tar": attr.label(
            default = Label("//build_tar"),
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
