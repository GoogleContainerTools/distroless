"generate digest for oci_image and oci_image_index"

load("@aspect_bazel_lib//lib:copy_file.bzl", "copy_file")
load("@aspect_bazel_lib//lib:directory_path.bzl", "directory_path")
load("@aspect_bazel_lib//lib:jq.bzl", "jq")

# Normally we'd use the `.digest` target that rules_oci creates for every oci_image but
# we also use oci_image_index which does not have a digest target. This was fixed in
# https://github.com/bazel-contrib/rules_oci/pull/742 but it on the 2.x releases of rules_oci
# TODO: Remove this once we upgrade to rules_oci 2.x
def digest(name, image, **kwargs):
    # `oci_image_rule` and `oci_image_index_rule` produce a directory as default output.
    # Label for the [name]/index.json file
    directory_path(
        name = "_{}_index_json".format(name),
        directory = image,
        path = "index.json",
        **kwargs
    )

    copy_file(
        name = "_{}_index_json_cp".format(name),
        src = "_{}_index_json".format(name),
        out = "_{}_index.json".format(name),
        **kwargs
    )

    # Matches the [name].digest target produced by rules_docker container_image
    jq(
        name = name,
        args = ["--raw-output"],
        srcs = ["_{}_index.json".format(name)],
        filter = """.manifests[0].digest""",
        out = name + ".json.sha256",  # path chosen to match rules_docker for easy migration
        **kwargs
    )
