"repositories for java"

load("//private/remote:temurin_archive.bzl", "temurin_archive")

JAVA_RELEASE_VERSIONS = {
    "temurin21_jre_amd64": "21.0.4",
    "temurin21_jdk_amd64": "21.0.4",
    "temurin21_jre_arm64": "21.0.4",
    "temurin21_jdk_arm64": "21.0.4",
    "temurin21_jre_ppc64le": "21.0.4",
    "temurin21_jdk_ppc64le": "21.0.4",
}

def repositories():
    "java archives"
    temurin_archive(
        name = "temurin21_jre_amd64",
        sha256 = "d3affbb011ca6c722948f6345d15eba09bded33f9947d4d67e09723e2518c12a",
        strip_prefix = "jdk-21.0.4+7-jre",
        urls = ["https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.4%2B7/OpenJDK21U-jre_x64_linux_hotspot_21.0.4_7.tar.gz"],
        version = "21.0.4+7",
        architecture = "amd64",
        control = "//java:control",
    )
    temurin_archive(
        name = "temurin21_jdk_amd64",
        sha256 = "51fb4d03a4429c39d397d3a03a779077159317616550e4e71624c9843083e7b9",
        strip_prefix = "jdk-21.0.4+7",
        urls = ["https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.4%2B7/OpenJDK21U-jdk_x64_linux_hotspot_21.0.4_7.tar.gz"],
        version = "21.0.4+7",
        architecture = "amd64",
        control = "//java:control",
    )
    temurin_archive(
        name = "temurin21_jre_arm64",
        sha256 = "58845ce4275f3ec74fba075597c8216bb201773da036c4703be8b7b7b457355d",
        strip_prefix = "jdk-21.0.4+7-jre",
        urls = ["https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.4%2B7/OpenJDK21U-jre_aarch64_linux_hotspot_21.0.4_7.tar.gz"],
        version = "21.0.4+7",
        architecture = "arm64",
        control = "//java:control",
    )
    temurin_archive(
        name = "temurin21_jdk_arm64",
        sha256 = "d768eecddd7a515711659e02caef8516b7b7177fa34880a56398fd9822593a79",
        strip_prefix = "jdk-21.0.4+7",
        urls = ["https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.4%2B7/OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.4_7.tar.gz"],
        version = "21.0.4+7",
        architecture = "arm64",
        control = "//java:control",
    )
    temurin_archive(
        name = "temurin21_jre_ppc64le",
        sha256 = "46cf93653e2b553fb1c91760cfe2ff20999ba358d648d2df69e5948784768440",
        strip_prefix = "jdk-21.0.4+7-jre",
        urls = ["https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.4%2B7/OpenJDK21U-jre_ppc64le_linux_hotspot_21.0.4_7.tar.gz"],
        version = "21.0.4+7",
        architecture = "ppc64le",
        control = "//java:control",
    )
    temurin_archive(
        name = "temurin21_jdk_ppc64le",
        sha256 = "c208cd0fb90560644a90f928667d2f53bfe408c957a5e36206585ad874427761",
        strip_prefix = "jdk-21.0.4+7",
        urls = ["https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.4%2B7/OpenJDK21U-jdk_ppc64le_linux_hotspot_21.0.4_7.tar.gz"],
        version = "21.0.4+7",
        architecture = "ppc64le",
        control = "//java:control",
    )
