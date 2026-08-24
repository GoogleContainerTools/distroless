"cosign module extension"

load("@rules_oci//cosign:repositories.bzl", "cosign_register_toolchains")

def _cosign_extension_impl(module_ctx):
    cosign_register_toolchains("oci_cosign", register = False)

cosign = module_extension(
    implementation = _cosign_extension_impl,
)
