"java ca certificates"

load("@rules_distroless//distroless:defs.bzl", "java_keystore")
load("//common:variables.bzl", "MTIME")
load(":extract.bzl", "tar_extract_file")

def java_cacerts(name, archive):
    tar_extract_file(
        name = name + "_extract",
        archive = archive,
        file = "./etc/ssl/certs/ca-certificates.crt",
    )

    java_keystore(
        name = name,
        certificates = [
            ":" + name + "_extract",
        ],
        time = MTIME,
    )
